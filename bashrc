#############-*-sh-*-#
# Bash configuration #
######################

DIR=$(dirname $(readlink -f $BASH_SOURCE))

COMP_CONFIGURE_HINTS=1
COMP_TAR_INTERNAL_PATHS=1
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
elif [[ -f /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
else
  echo $'\e[1mBash completion disabled\e[0m'
fi
unset COMP_CONFIGURE_HINTS
unset COMP_TAR_INTERNAL_PATHS

if [[ $- == *i* ]]; then
  . $DIR/welcome
  
  . $DIR/bash_options
fi

. $DIR/environment

. $DIR/prompts

. $DIR/title

. $DIR/aliases

. $DIR/ls_colors

TIMEFORMAT=$'\e[33m%J en %R(U:%U, S:%S) dont %P%% proc\e[0m'

PROMPT_COMMAND="history -a"
HISTFILESIZE=65536
HISTSIZE=100000
HISTFILE=~/.bash_history
HISTTIMEFORMAT="%F %T"
