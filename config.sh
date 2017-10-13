get_value() {
    if [ -f "$PENV_CONFIG_FILE" ]; then
        local val=$(cat $PENV_CONFIG_FILE |grep $1 |cut -d "=" -f2)
    else
        echo "The config file doesn't exist"
        return 1
    fi
    echo $val
}

get_folder() {
    local val=$(get_value "pyenv_folder")

    if [ -z "$val" ]; then
        echo "No folder set, please set your folder in the config file"
        return 1
    fi

    if [ ! -d "$val" ]; then
        echo "The folder set doesn't exist"
        return 1
    fi

    echo $val
}

get_python_path() {
    local val=$(get_value "python_interpreter")

    if [ -z "$val" ]; then
        echo "No path set, please set the path in the config file"
        return 1
    fi

    if [ ! -d "$val" ]; then
        echo "The path set doesn't exist"
        return 1
    fi

    echo $val

}
