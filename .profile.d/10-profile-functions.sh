function kw_dirlist_prepend() {
    local list_name="$1"
    local dir="$2"

    if [[ -d "${dir}" ]]; then
        export "${list_name}"="${dir}:${!list_name}"
    fi
}

function kw_dirlist_append() {
    local list_name="$1"
    local dir="$2"

    if [[ -d "${dir}" ]]; then
        export "${list_name}"="${!list_name}:${dir}"
    fi
}

function kw_path_prepend() {
    kw_dirlist_prepend PATH "$1"
}

function kw_path_append() {
    kw_dirlist_append PATH "$1"
}
