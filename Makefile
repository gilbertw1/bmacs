clean:
	@rm -f init.elc bmacs.el bmacs.elc

compile: init.el bmacs.org clean
	@emacs -Q --batch -l 'lisp/compile.el'

update: 
	@emacs -Q --batch -l "lisp/update.el"
