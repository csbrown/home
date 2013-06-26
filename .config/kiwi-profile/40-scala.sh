if [[ -d "$HOME/opt/scala/active" ]]; then
    export SCALA_HOME="$HOME/opt/scala/active"
    kw_path_prepend "$SCALA_HOME/bin"
fi
