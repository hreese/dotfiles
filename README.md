# dotfiles #

My personal dotfiles.

## Installation ##

    cd ~
    git init
    git remote add origin git@github.com:hreese/dotfiles.git
    git pull origin master
    git submodule update --init --recursive
    
    # gnome-terminal
    .themes/gnome-terminal-colors-solarized/solarize
    mkdir -p ~/.local/share/gedit/styles

    # gedit
    cd ~/.local/share/gedit/styles
    for i in ../../../../.themes/gedit-solarized/*xml; do
      ln -s ${i} .
    done   
    
