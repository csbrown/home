function kw_path_prepend() {
    if [[ -d "$1" ]]; then
        export PATH="$1:$PATH"
    fi
}

function kw_path_append() {
    if [[ -d "$1" ]]; then
        export PATH="$PATH:$1"
    fi
}
