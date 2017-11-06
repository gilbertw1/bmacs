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

Bryan's emacs (heavily influenced by and borrows from the amazing DOOM configuration by hlissner)


### Usage

Install

    git clone git@github.com:gilbertw1/bmacs-new.git ~/.emacs.d

Run (May need to restart once or twice before packages finish installing on initial run)

    emacs

### Scripts

Clean: Delete compiled files

    ./scripts/clean.sh

Byte Compile: Compile configuration for performace (Recompile required when new changes are made)

    ./scripts/compile.sh

Update Packages

    ./scripts/update.sh
