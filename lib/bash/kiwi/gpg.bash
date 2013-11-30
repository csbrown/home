kw_gpg_agent_lock="$HOME/.gnupg/gpg-agent.lock"
kw_gpg_agent_env_file="$HOME/.gnupg/gpg-agent.env"

function kw_gpg_start_agent() {
    local PINENTRY_BINARY

    if ! [[ -d "$HOME/.gnupg" ]]; then
        return 1
    fi

    case "$(uname)" in
        'Linux')
            PINENTRY_BINARY='/usr/bin/pinentry-curses'
            ;;
        'Darin')
            PINENTRY_BINARY='/opt/local/bin/pinentry-curses'
            ;;
    esac

    if which flock >&/dev/null; then
        if ! flock -n "$kw_gpg_agent_lock" \
                env PINENTRY_BINARY="$PINENTRY_BINARY" \
                gpg-agent \
                    --daemon \
                    --write-env-file "$kw_gpg_agent_env_file" >&/dev/null
        then return 1
        fi
    elif which python >&/dev/null; then
        # Mac lacks flock(1), yet Python 2.7 exposes flock(2) through the fcntl
        # module.
        if ! python >&/dev/null <(cat <<-EOF
		import fcntl, os
		with open('$kw_gpg_agent_lock', 'w') as lock_file:
		    fcntl.flock(lock_file, fcntl.LOCK_NB | fcntl.LOCK_EX)
		    os.environ['PINENTRY_BINARY'] = '$PINENTRY_BINARY'
		    os.execvp('gpg-agent',
		              ['gpg-agent',
		               '--daemon',
		               '--write-env-file', '$kw_gpg_agent_env_file'])
		EOF
		)
        then return 1
        fi
    else
        return 1
    fi

    echo -n "gpg: Started agent " && cut -d= -f2 <"$kw_gpg_agent_env_file"
}

function kw_gpg_connect_to_agent() {
    source "$kw_gpg_agent_env_file" >&/dev/null || return 1
    export GPG_AGENT_INFO
    export GPG_AGENT_PID=$(cut -d: -f2 < "$kw_gpg_agent_env_file") || return 1
    kill -0 "$GPG_AGENT_PID" >&/dev/null || return 1
    echo "gpg: Connected to agent $GPG_AGENT_INFO"
}
