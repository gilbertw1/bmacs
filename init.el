(require 'org)
(unless (file-exists-p "~/.emacs.d/bmacs.elc")
  (org-babel-tangle-file "~/.emacs.d/bmacs.org")
  (byte-compile-file "~/.emacs.d/bmacs.el"))

(load-file "~/.emacs.d/bmacs.elc")
