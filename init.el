
;; Let's start emacs up quietly.
(advice-add #'display-startup-echo-area-message :override #'ignore)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      mode-line-format nil)

(require 'org)

(if (file-exists-p "~/.emacs.d/bmacs.elc")
    (load-file "~/.emacs.d/bmacs.elc")
  (org-babel-load-file "~/.emacs.d/bmacs.org"))
