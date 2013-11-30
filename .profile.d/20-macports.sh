if [[ "$(uname)" = "Darwin" ]]; then
    kw_path_prepend "/opt/local/bin"
    kw_path_prepend "/opt/local/sbin"
fi
