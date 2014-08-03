function kw_logi() {
    >/dev/stderr printf "$@"
}

function kw_loge() {
    >/dev/stderr printf "error: "
    >/dev/stderr printf "$@"
}
