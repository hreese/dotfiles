# dotfiles #

My personal dotfiles.

## Installation ##

    cd ~
    git init
    git remote add origin git@github.com:hreese/dotfiles.git
    git pull origin master
    git submodule update --init --recursive

### vim ###
    
    vim +BundleInstall +qall
    mkdir ~/.undodir_vim

### gnome-terminal ###

    .themes/gnome-terminal-colors-solarized/solarize

### gedit ###

    mkdir -p ~/.local/share/gedit/styles
    cd ~/.local/share/gedit/styles
    for i in ../../../../.themes/gedit-solarized/*xml; do
      ln -s ${i} .
    done   
    
### powerline ###

    # Fedora
    sudo yum install pip-python -y
    pip-python install --user git+git://github.com/Lokaltog/powerline
    # rest
    pip install --user git+git://github.com/Lokaltog/powerline

