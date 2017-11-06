#!/bin/sh

rm bmacs.el bmacs.elc

emacs -Q --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.emacs.d/bmacs.org")'
emacs -Q --batch --eval "(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))" \
                 -f batch-byte-compile 'bmacs.el'
