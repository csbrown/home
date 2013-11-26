export SSH_AGENT_ENV="$HOME/.ssh/ssh-agent.env"
export SSH_AGENT_LOCK="$HOME/.ssh/ssh-agent.lock"

function kw_ssh_start_agent() {
    if ! [[ -d "$HOME/.ssh" ]]
    then return 1
    fi

    if ! flock -n "$SSH_AGENT_LOCK" \
            sh -c "ssh-agent > '$SSH_AGENT_ENV'"
    then return 1
    fi

    echo "ssh: Started agent $SSH_AUTH_SOCK:$SSH_AGENT_PID"
}

function kw_ssh_connect_to_agent() {
    source "$SSH_AGENT_ENV" >&/dev/null || return 1
    kill -0 "$SSH_AGENT_PID" >&/dev/null || return 1
    echo "ssh: Connected to agent $SSH_AUTH_SOCK:$SSH_AGENT_PID"
}

function kw_ssh_add_key_maybe() {
    local key_path="$1"
    if [[ -r "$key_path" ]]; then
        echo -n "ssh: "
        ssh-add "$key_path"
    fi
}
