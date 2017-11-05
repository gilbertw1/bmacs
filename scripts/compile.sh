#!/bin/sh

rm bmacs.el bmacs.elc

emacs -Q --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.emacs.d/bmacs.org")'
emacs -Q --batch -f batch-byte-compile 'bmacs.el'
