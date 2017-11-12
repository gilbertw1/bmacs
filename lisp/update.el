(defmacro quiet! (&rest forms)
  "Run FORMS without making any noise."
  `(if nil
       (progn ,@forms)
     (fset 'doom--old-write-region-fn (symbol-function 'write-region))
     (cl-letf ((standard-output (lambda (&rest _)))
               ((symbol-function 'load-file) (lambda (file) (load file nil t)))
               ((symbol-function 'message) (lambda (&rest _)))
               ((symbol-function 'write-region)
                (lambda (start end filename &optional append visit lockname mustbenew)
                  (unless visit (setq visit 'no-message))
                  (doom--old-write-region-fn
                   start end filename append visit lockname mustbenew)))
               (inhibit-message t)
               (save-silently t))
       ,@forms)))

(setq package-user-dir (expand-file-name "~/.emacs.d/.local/packages/elpa"))

(require 'package)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

(quiet!
  (package-initialize)
  (package-refresh-contents))


(let (upgrades)
  (cl-flet ((get-version (name where)
                         (let ((pkg (cadr (assq name where))))
                           (when pkg
                             (package-desc-version pkg)))))
    (dolist (package (mapcar #'car package-alist))
      (let ((in-archive (get-version package package-archive-contents)))
        (when (and in-archive
                   (version-list-< (get-version package package-alist)
                                   in-archive))
          (push (cadr (assq package package-archive-contents))
                upgrades)))))
  (when upgrades
    (message "\nFound %d Package Update%s:"
             (length upgrades)
             (if (= (length upgrades) 1) "" "s"))
    (let ((max-len
           (or (car (sort (mapcar (lambda (it) (length (format "%s" (package-desc-name it)))) upgrades) #'>))
               10)))
      (dolist (new-package upgrades)
        (let ((old-package (cadr (assq (package-desc-name new-package)
                                       package-alist))))
          (message (format " + %%-%ds %%-%ds -> %%s" (+ max-len 2) 14)
                   (package-desc-name new-package)
                   (package-version-join (package-desc-version old-package))
                   (package-version-join (package-desc-version new-package)))))
      (when (y-or-n-p "\nProceed?")
        (princ "\n")
        (save-window-excursion
          (dolist (new-package upgrades)
            (let ((old-package (cadr (assq (package-desc-name new-package)
                                           package-alist))))
              (message "Updating %s" (package-desc-name new-package))
              (quiet!
               (package-install new-package)
               (package-delete old-package))
              (message "  \e[32mDONE\e[0m"))))))
    (message "\nFinished."))

  (when (not upgrades)
    (message "Everything up to date.")))


