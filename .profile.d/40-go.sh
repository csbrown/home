if [[ -d ~/opt/go ]]; then
    export GOROOT="$HOME/opt/go"
    kw_path_prepend "$GOROOT/bin"
fi

kw_dirlist_prepend GOPATH "$HOME/go"
kw_dirlist_prepend PATH "$HOME/go/bin"
