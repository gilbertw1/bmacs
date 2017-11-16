;;; Package --- Summary

;;; Commentary:
;; The main entry point into BMACS. It either loads the pre-compiled BMACS configuration file
;; or tangles and loades the BMACS literate org configuration file.

;;; Code:

;; Let's start emacs up quietly.
(advice-add #'display-startup-echo-area-message :override #'ignore)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      mode-line-format nil)


(let ((file-name-handler-alist nil))
  (if (file-exists-p (expand-file-name "bmacs.elc" user-emacs-directory))
      (load-file (expand-file-name "bmacs.elc" user-emacs-directory))
    (require 'org)
    (org-babel-load-file (expand-file-name "bmacs.org" user-emacs-directory))))

;;; init.el ends here
