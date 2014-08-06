source $HOME/lib/bash/kiwi/ssh.bash

kw_ssh_start_agent >&/dev/null

if kw_ssh_connect_to_agent >&/dev/null; then
    kw_ssh_add_key_maybe "$HOME/.ssh/id_rsa" >&/dev/null
fi
