############-*-sh-*-#
# Zsh configuration #
#####################

# Set  default TERM
TERM=xterm-256color

DIR=${$(print -P "%x"):A:h}
if [[ ! -e /usr/share/terminfo/$TERM[1]/$TERM && ! -e /lib/terminfo/$TERM[1]/$TERM ]]; then
    echo "\$TERM=$TERM not found. Using TERM=xterm."
    TERM=xterm
fi

. $DIR/environment

. $DIR/welcome

. $DIR/title

. $DIR/ls_colors

. $DIR/zsh_modules

. $DIR/zsh_options

. $DIR/zsh_completion

. $DIR/zsh_bindings

. $DIR/prompts

. $DIR/aliases

. $DIR/archives_helpers

# A récupérer ici:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting
if [[ -e $DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then 
    ZSH_HIGHLIGHT_MAXLENGTH=100

    . $DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

    if [[ "$TERM" == xterm-256color ]]; then
        ZSH_HIGHLIGHT_STYLES[cursor]=fg=250

        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=27
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=63
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=135
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=171
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=207

        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=203
        ZSH_HIGHLIGHT_STYLES[bracket-error]=bg=196
        ZSH_HIGHLIGHT_STYLES[builtin]=fg=77
        ZSH_HIGHLIGHT_STYLES[function]=fg=77
        ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=77
        ZSH_HIGHLIGHT_STYLES[command]=fg=77
        ZSH_HIGHLIGHT_STYLES[alias]=fg=77
        ZSH_HIGHLIGHT_STYLES[assign]=fg=77
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=115
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=223
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=220

        ZSH_HIGHLIGHT_STYLES[globbing]=fg=135
        ZSH_HIGHLIGHT_STYLES[path]=fg=147
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=035
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=227
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=none
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=none
    fi
fi

zrecompile $DIR 

##########
# Others #
##########

typeset -U path cdpath manpath fpath

# Report stats
REPORTTIME=10
# TIMEFMT=$'\e[33m%J finished in %*E(U:%U, S:%S) using %P processor and %KKB(S:%X, U:%D) avg (%MKB max), %w voluntary contexts switch and %c unvoluntary %F major cache fault and %R minor\e[0m'
TIMEFMT=$'\e[33m%J finished in %*E(U:%U, S:%S) using %P processor\e[0m'

spantime=10 # 10 s, if don't want to pollute env, put its value directly.

function preexec_jobreport { 
    pgmname1=$1 
    pgmname2=$2 
    pgmname3=$3 
    starttime=`date +%s`
}

function precmd_jobreport {
    local T_USER T_SYS T_TOTAL P_CPU NR_SWAP M_SHARED M_NONSHARED M_TOTAL M_MAX F_MAJ F_MIN IO_IN IO_OUT MSG_IN MSG_OUT SIG_IN CTX_SW_V CTX_SW_U NAME
    if [[ $pgmname1 != vim && $pgmname1 != emacs && -n $starttime ]]; then
        span=$(($(date +%s) - $starttime))
        if (($span > ${spantime:-600})); then
            eval $(TIMEFMT="T_USER=%U T_SYS=%S T_TOTAL=%E P_CPU=%P NR_SWAP=%W M_SHARED=%X M_NONSHARED=%D M_TOTAL=%K M_MAX=%M F_MAJ=%F F_MIN=%R IO_IN=%I IO_OUT=%O MSG_IN=%r MSG_OUT=%s SIG_IN=%k CTX_SW_V=%w CTX_SW_U=%c NAME=%J"; time |& tail -1)
            [[ ${P_CPU%\%} -gt 0 ]] && which notify-send > /dev/null && notify-send "<b>Shell command finished</b>" \
"<i><b>$pgmname1</b></i> finished
   - Returns $?
   - Time: ${span}s (user: $T_USER, sys: $T_SYS)
   - Pages faults: maj: $F_MAJ, min: $F_MIN
   - Context switches: volunt: $CTX_SW_V, unvolunt: $CTX_SW_U
   - Received $SIG_IN signals
   - Packets: in: $MSG_IN, out: $MSG_OUT
   - IO: in: $IO_IN, out: $IO_OUT"
        fi
        unset span
    fi
    unset pgmname1 pgmname2 pgmname3 starttime
}
preexec_functions+=(preexec_jobreport)
precmd_functions+=(precmd_jobreport)

# Watch who login/logout on my box
#watch=(notme)
WATCHFMT="%B->%b %n has just %a %(l:tty%l:%U-Ghost-%u)%(m: from %m:)"
LOGCHECK=20

[ -d /usr/share/zsh/help ] && 
  HELPDIR=/usr/share/zsh/help

# History
SAVEHIST=65535
HISTSIZE=100000
HISTFILE=~/.zshhist

limit core 0

# Freeze tty params (you can forget "reset" command)
ttyctl -f

