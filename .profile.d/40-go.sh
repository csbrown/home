if ! which go >&/dev/null; then
    return
fi

# Other config files should use $kw_goroot to find the GOROOT.  We don't set
# GOROOT itself because that's generally a bad idea unless go is installed to
# a custom location or if one is developing go itself.
export kw_goroot=$(eval $(go env) && echo $GOROOT)

export GOPATH="$HOME/go"
kw_path_prepend "$GOPATH/bin"
