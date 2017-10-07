get_folder() {
    local path=$HOME/.config/penv/config
    if [ -f $path ]; then
        local dir=$(cat $path |grep pyenv_folder |cut -d "=" -f2)
    else
        echo "The config file doesn't exist"
        return 1
    fi

    if [ -z $dir ]; then
        echo "No folder set, please set your folder in the config file"
        return 1
    fi

    if [ ! -d "$dir" ]; then
        echo "The folder set doesn't exist"
        return 1
    fi

    echo $dir
}

get_python_path() {
    local path=$HOME/.config/penv/config

    if [ -f $path ]; then
        local dir=$(cat $path |grep python_interpreter |cut -d "=" -f2)
    else
        echo "The config file doesn't exist"
        return 1
    fi

    if [ -z $dir ]; then
        echo "No path set, please set the path in the config file"
        return 1
    fi

    if [ ! -d "$dir" ]; then
        echo "The path set doesn't exist"
        return 1
    fi

    echo $dir

}
