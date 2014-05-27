if [[ -d ~/opt/go ]]; then
    export GOROOT="$HOME/opt/go"
    kw_path_prepend "$GOROOT/bin"
fi

export GOPATH="$HOME/go"
kw_path_prepend "$GOPATH/bin"
