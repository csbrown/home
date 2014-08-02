function kw_dirlist_insert__() {
    local list_name="$1"
    local pos="$2"
    local dir="$3"

    if [[ "$pos" != "0" ]] && [[ "$pos" != "-1" ]]; then
        return 1
    elif ! [[ -d "${dir}" ]]; then
        return 0
    elif [[ -z "${!list_name}" ]]; then
        # One should never add the empty element to LD_LIBRARY_PATH, because ld
        # interprets an empty element as the current directory. For example,
        # LD_LIBRARY_PATH="/lib:" contains two elements, the last of which is
        # empty.
        export "${list_name}"="${dir}"
        return 0
    elif [[ "$pos" = "0" ]]; then
        export "${list_name}"="${dir}:${!list_name}"
    elif [[ "$pos" = "-1" ]]; then
        export "${list_name}"="${!list_name}:${dir}"
    else
        return 1
    fi
}

function kw_dirlist_prepend() {
    kw_dirlist_insert__ "$1" 0 "$2"
}

function kw_dirlist_append() {
    kw_dirlist_insert__ "$1" -1 "$2"
}

function kw_path_prepend() {
    kw_dirlist_prepend PATH "$1"
}

function kw_path_append() {
    kw_dirlist_append PATH "$1"
}
