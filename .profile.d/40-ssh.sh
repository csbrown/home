source $HOME/lib/bash/kiwi/ssh.bash

kw_ssh_start_agent

if kw_ssh_connect_to_agent; then
    kw_ssh_add_key_maybe "$HOME/.ssh/id_rsa"
fi
