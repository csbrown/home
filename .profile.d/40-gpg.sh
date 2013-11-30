export GPG_TTY=$(tty)
export GPG_AGENT_LOCK="$HOME/.gnupg/gpg-agent.lock"
export GPG_AGENT_ENV="$HOME/.gnupg/gpg-agent.env"

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

    if ! flock -n "$GPG_AGENT_LOCK" \
            env PINENTRY_BINARY="$PINENTRY_BINARY" \
            gpg-agent \
                --daemon \
                --write-env-file "$GPG_AGENT_ENV" >&/dev/null
    then return 1
    fi

    echo -n "gpg: Started agent " && cut -d= -f2 <"$GPG_AGENT_ENV"
}

function kw_gpg_connect_to_agent() {
    source "$GPG_AGENT_ENV" >&/dev/null || return 1
    export GPG_AGENT_INFO
    export GPG_AGENT_PID=$(cut -d: -f2 < "$GPG_AGENT_ENV") || return 1
    kill -0 "$GPG_AGENT_PID" >&/dev/null || return 1
    echo "gpg: Connected to agent $GPG_AGENT_INFO"
}

kw_gpg_start_agent
kw_gpg_connect_to_agent
