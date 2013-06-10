for i in $HOME/.config/profile/*.sh; do
    if [[ -r "$i" ]]; then
        source $i
    fi
done

export PATH

# vim: ft=sh et sw=4:
