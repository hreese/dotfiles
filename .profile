# .profile

# According to bash(1), interactive login shells read and execute
# /etc/profile
# ~/.bash_profile
# ~/.bash_login
# ~/.profile
#
# Interactive shells that are note login shells, bash reads and executes
# ~/.bashrc,

# Get the aliases and functions
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi

# local binaries
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# local config
if [ -r $HOME/.profile.local ]; then
    . $HOME/.profile.local
fi

export PATH

# local TeXLive
export PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH

# Google Go
if [ -d "${HOME}/go" ]; then
    export GOPATH=$HOME/gocode
    export GOROOT=${HOME}/go
    export GOBIN=${GOROOT}/bin
    export GOOS=linux
    export GOARCH=amd64
    export PATH=${PATH}:${GOBIN}
fi

# 256 colors
if [ -e /lib/terminfo/x/xterm-256color -o -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# dircolors (Solarized)
# https://github.com/seebi/dircolors-solarized
if [ -r "$HOME/.dircolors-solarized/dircolors.256dark" ]; then
    eval $(dircolors -b "$HOME/.dircolors-solarized/dircolors.256dark")
fi

# colorize grep matches
export GREP_OPTIONS="--color=always ${GREP_OPTIONS}"
export GREP_COLOR=31

# needed by the gpg-vim-plugin
export GPG_TTY=$(tty)

# some aliases
alias lsh='ls -lthr'
alias lsha='ls -lthra'
alias g='git'
alias s='ssh'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
export MC_SKIN="$HOME/.themes/mc-solarized-skin/solarized.ini"

