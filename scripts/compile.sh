#!/bin/sh

rm -f ~/.emacs.d/bmacs.el ~/.emacs.d/bmacs.elc

emacs -Q --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.emacs.d/bmacs.org")'
emacs -Q --batch --eval "(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))" \
                 -f batch-byte-compile '~/.emacs.d/bmacs.el'
