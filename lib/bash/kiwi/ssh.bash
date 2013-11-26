kw_ssh_agent_env_file="$HOME/.ssh/ssh-agent.env"
kw_ssh_agent_lock="$HOME/.ssh/ssh-agent.lock"

function kw_ssh_start_agent() {
    if ! [[ -d "$HOME/.ssh" ]]
    then return 1
    fi

    if ! flock -n "$kw_ssh_agent_lock" \
            sh -c "ssh-agent > '$kw_ssh_agent_env_file'"
    then return 1
    fi

    (
        source "$kw_ssh_agent_env_file" >&/dev/null \
        && echo "ssh: Started agent $SSH_AUTH_SOCK:$SSH_AGENT_PID"
    )
}

function kw_ssh_connect_to_agent() {
    source "$kw_ssh_agent_env_file" >&/dev/null || return 1
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
