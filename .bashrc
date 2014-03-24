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
# open
# ------------------------------
if [[ "$(uname)" = "Linux" ]]; then
    alias open=xdg-open
fi

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

if [[ "$PROMPT_COMMAND" = kw_prompt_command_guard\;* ]]; then
    # ~/.bashrc has previously set PROMPT_COMMAND, perhaps because we are in
    # a subshell. Don't set it again.
    kw_prompt_command_old=
elif [[ "$PROMPT_COMMAND" ]]; then
    # The system has defined PROMPT_COMMAND, and ~/.bashrc has not yet
    # overridden it. Let's append our custom prompt command to the system's.
    #
    # Termina.app sets PROMPT_COMMAND='update_terminal_cwd; ' and
    # gnome-terminal PROMPT_COMMAND='__vte_prompt_command'. The signficant
    # difference is that gnome-terminal's contains no terminal ';', and Mac's
    # terminates with '; '. Here we massage the old PROMPT_COMMAND to
    # consistently terminate with ';' regardless of OS.
    kw_prompt_command_old="$(echo "$PROMPT_COMMAND" | sed 's/[ ;]*$//');"
else
    # PROMPT_COMMAND is empty. Neither the system nor a previous invocation of
    # ~/.bashrc has set it.
    kw_prompt_command_old=
fi

# Include git-prompt.sh.
# Each system installs git-prompt.sh to a different location.
for git_prompt in \
        /usr/share/git-core/contrib/completion/git-prompt.sh \
        /usr/share/git/git-prompt.sh \
        /usr/share/git/completion/git-prompt.sh \
        /opt/local/share/git-core/git-prompt.sh \
        /opt/local/share/git-core/contrib/completion/git-prompt.sh; do
    if [[ -f $git_prompt ]]; then
        source $git_prompt
        break;
    fi
done

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

PROMPT_DIRTRIM=3
PROMPT_COMMAND="kw_prompt_command_guard; ${kw_prompt_command_old} PS1=\"\e[\${kw_ps1_bg_color}m[\!] \u@\h:\w\$(__git_ps1 \" (%s)\")\e[${kw_color_reset}m\n> \""

#
# The PROMPT_COMMAND begins with this canary function if and only if ~/.bashrc
# already set PROMPT_COMMAND, possibly overriding any system-defined
# PROMPT_COMMAND.
#
# Careful use of this canary allows us to avoid setting an invalid
# PROMPT_COMMAND in subshells.
#
function kw_prompt_command_guard() {
    true
}

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
