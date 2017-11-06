```
$$$$$$$\  $$\      $$\  $$$$$$\   $$$$$$\   $$$$$$\  
$$  __$$\ $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ 
$$ |  $$ |$$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ /  \__|
$$$$$$$\ |$$\$$\$$ $$ |$$$$$$$$ |$$ |      \$$$$$$\  
$$  __$$\ $$ \$$$  $$ |$$  __$$ |$$ |       \____$$\ 
$$ |  $$ |$$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$\   $$ |
$$$$$$$  |$$ | \_/ $$ |$$ |  $$ |\$$$$$$  |\$$$$$$  |
\_______/ \__|     \__|\__|  \__| \______/  \______/ 
```

- - -

BMACS
=====

Bryan's Emacs. This is my personal emacs configuration written as a literate org file. It has been
optimized to be run graphically on Arch Linux using Emacs 26+.

It is heavily influenced by and would not exist without the fantastic
[DOOM Emacs configuration](https://github.com/hlissner/doom-emacs). 


### Usage

Install

    git clone git@github.com:gilbertw1/bmacs-new.git ~/.emacs.d
    ~/.emacs.d/scripts/compile.sh

Run

    emacs

### Scripts

* `clean.sh`: Delete compiled files
* `compile.sh`: Byte compile for performance (Recompile required when new changes are made)
* `update.sh`: Update Packages
