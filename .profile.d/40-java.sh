if [[ -d "$HOME/opt/java/active" ]]; then
    export JAVA_HOME="$HOME/opt/java/active"
    kw_path_prepend "$JAVA_HOME/bin"
fi
