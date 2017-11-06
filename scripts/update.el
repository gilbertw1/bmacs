(setq package-user-dir (expand-file-name "~/.emacs.d/.local/packages/elpa"))

(require 'package)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

(package-initialize)
(package-refresh-contents)

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
    (princ (format "\nUpgraded %d package%s\n"
                   (length upgrades)
                   (if (= (length upgrades) 1) "" "s")))
    (save-window-excursion
      (dolist (package-desc upgrades)
        (princ (format "  - %s\n" (package-desc-full-name package-desc)))
        (let ((old-package (cadr (assq (package-desc-name package-desc)
                                       package-alist))))
          (package-install package-desc)
          (package-delete  old-package)))))
  (princ "All packages are up to date\n"))
