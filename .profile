# .profile

# Get the aliases and functions
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH

# local TeXLive
export PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH

# Google Go
if [ -d "${HOME}/go" ]; then
    export GOROOT=${HOME}/go
    export GOBIN=${GOROOT}/bin
    export GOOS=linux
    export GOARCH=amd64
    export PATH=${PATH}:${GOBIN}
fi


# 256 colors
if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# dircolors (Solarized)
# https://github.com/seebi/dircolors-solarized
# …

# some aliases
alias lsh='ls -lthr'
alias lsha='ls -lthra'
alias GREYdient='yes "$(seq 232 255;seq 254 -1 233)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done'
