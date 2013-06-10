if [ -d "$HOME/opt/java/active" ]; then
    JAVA_HOME="$HOME/opt/java/active"; export JAVA_HOME
fi

kw_path_prepend "$JAVA_HOME/bin"
