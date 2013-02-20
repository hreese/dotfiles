# .bash_profile

# History management
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
HISTIGNORE="clear:bg:fg:cd:cd -:exit:date:w:* --help"

# Shared history: Save and reload the history after each command finishes (ugly hack)
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

