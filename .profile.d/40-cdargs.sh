function cv () {
    local cdarg_alias="$1"
    cdargs "$cdarg_alias"
    if [[ $? -eq 0 ]]; then
        cd "$(cat "$HOME/.cdargsresult")"
    fi
}

