source "$HOME/lib/bash/kiwi/gpg.bash"

export GPG_TTY=$(tty)
kw_gpg_start_agent >&/dev/null
kw_gpg_connect_to_agent >&/dev/null
