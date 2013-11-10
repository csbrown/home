# ----------------------------------------------------------------------------
# Includes
# ----------------------------------------------------------------------------

include_dirs=(
    /opt/local/etc/profile.d
    $HOME/.profile.d
)

for d in ${include_dirs[@]}; do
    if ! [[ -r $d && -x $d ]]; then
        continue
    fi

    for i in $(LC_COLLATE=C command ls $d); do
        i=$d/$i
        if [[ $i = @(*.sh|*.bash) && -r $i ]]; then
            source $i
        fi
    done
done

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------

function upd() {
    case $# in
        0)
            cd ..
            return
            ;;
        1)
            for ((x=0; x < $1; ++x)); do
                cd ..
            done
            return
            ;;
        *)
            echo "upd: usage error"
            return 1
            ;;
    esac
}

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------

# ------------------------------
# diff
# ------------------------------
if which colordiff >&/dev/null; then
    alias diff='colordiff'
fi

# ------------------------------
# dirs
# ------------------------------
alias dirs='dirs -v'

# ------------------------------
# grep
# ------------------------------
_kw_grep_opts='--color=auto'

alias egrep="egrep $_kw_grep_opts"
alias grep="grep $_kw_grep_opts"

unset _kw_grep_opts

# ------------------------------
# ls
# ------------------------------
case "$(uname)" in
    'Linux')
        _kw_ls_opts='-vh --color=auto'
        ;;
    'Darwin')
        _kw_ls_opts='-vhG'
        ;;
esac

alias lc="ls -C $_kw_ls_opts"
alias ls="ls -1 $_kw_ls_opts"
alias ll="ls -l $_kw_ls_opts"

unset _kw_ls_opts

# ------------------------------
# pacman
# ------------------------------
if which pacman-color >&/dev/null; then
    alias pacman='pacman-color'
fi

# ----------------------------------------------------------------------------
# History
# ----------------------------------------------------------------------------

# Special tokens:
#       &: Ignore current line if it matches previous.
HISTIGNORE="&"

# ignorespace: Ignore lines that begin with a space. This allows the user to
#       manually filter commands from history.
HISTCONTROL="ignorespace"

# Append to history file; don't overwrite it.
shopt -s histappend

# ----------------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------------

if [[ "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND="$PROMPT_COMMAND; "
fi

PROMPT_DIRTRIM=3
PROMPT_COMMAND="${PROMPT_COMMAND}PS1=\"\e[\${kw_ps1_bg_color}m[\!] \u@\h:\w\$(__git_ps1 \" (%s)\")\e[${kw_color_reset}m\n> \""

#
# Set colors for a terminal with light background.
#
function kw_ps1_light() {
    kw_ps1_bg_color="$kw_color_bg_hi_green"
}

#
# Set colors for a terminal with dark background.
#
function kw_ps1_dark() {
    kw_ps1_bg_color="$kw_color_bg_blue"
}

# Assume a dark background.
kw_ps1_dark

# ----------------------------------------------------------------------------
# Misc Options
# ----------------------------------------------------------------------------

set noclobber

# Check winsize after each command. If winsize changed, then update LINES and
# COLUMNS.
shopt -s checkwinsize

# Attempt spell checking.
shopt -s dirspell

# vim: ft=sh et sw=4:
