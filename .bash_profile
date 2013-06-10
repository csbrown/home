if [ -r $HOME/.bashrc ]; then
    . $HOME/.bashrc
else
    # We don't have access to the full desired bash configuration, but at
    # a minimum we can set up a sane PATH.
    export PATH=$HOME/bin:$HOME/.local/bin:$PATH
fi

# vim: ft=sh et sw=4:
