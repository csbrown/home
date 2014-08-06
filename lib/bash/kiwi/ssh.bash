source $HOME/lib/bash/kiwi/log.bash

kw_ssh_agent_env_file="$HOME/.ssh/ssh-agent.env"
kw_ssh_agent_lock="$HOME/.ssh/ssh-agent.lock"

function kw_ssh_start_agent() {
    if ! [[ -d "$HOME/.ssh" ]]
    then return 1
    fi

    if which flock >&/dev/null; then
        if ! flock -n "$kw_ssh_agent_lock" \
                sh -c "ssh-agent > '$kw_ssh_agent_env_file'"
        then return 1
        fi
    elif which python >&/dev/null; then
        # Mac lacks flock(1), yet Python 2.7 exposes flock(2) through the fcntl
        # module.
        if ! python >&/dev/null <(cat <<-EOF
		import fcntl, os
		with open('$kw_ssh_agent_lock', 'w') as lock_file:
		    fcntl.flock(lock_file, fcntl.LOCK_NB | fcntl.LOCK_EX)
		    os.execvp('sh', ['sh', '-c', 'ssh-agent > "$kw_ssh_agent_env_file"'])
		EOF
		)
        then return 1
        fi
    else
        return 1
    fi

    (source "$kw_ssh_agent_env_file" >&/dev/null
     kw_logi "ssh: Started agent $SSH_AUTH_SOCK:$SSH_AGENT_PID\n")
}

function kw_ssh_connect_to_agent() {
    source "$kw_ssh_agent_env_file" >&/dev/null || return 1
    kill -0 "$SSH_AGENT_PID" >&/dev/null || return 1
    kw_logi "ssh: Connected to agent $SSH_AUTH_SOCK:$SSH_AGENT_PID\n"
}

function kw_ssh_add_key_maybe() {
    local key_path="$1"
    if [[ -r "$key_path" ]]; then
        kw_logi "ssh: "
        >/dev/stderr ssh-add "$key_path"
    fi
}
