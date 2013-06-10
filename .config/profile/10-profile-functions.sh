kw_path_prepend() {
    if [ -d "$1" ]; then
        PATH="$1:$PATH"
    fi
}

kw_path_append() {
    if [ -d "$1" ]; then
        PATH="$PATH:$1"
    fi
}
