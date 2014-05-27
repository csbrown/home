if ! which go >&/dev/null; then
    return
fi

export GOPATH="$HOME/go"
kw_path_prepend "$GOPATH/bin"
