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

Compile

    make compile

Run

    emacs

### Make Commands

`clean`: Delete compiled files

    make clean

`compile`: Byte compile for performance (Recompile required when new changes are made)

    make compile

`update.sh`: Update Packages

    make update

### Notes

Be sure to change `Configuration -> Variables -> Font` if you don't have Iosevka installed.
