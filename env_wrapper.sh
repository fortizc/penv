source "config.sh"

list_environments() {
    local folder=""
    folder=$(get_folder)

    if [ $? == 1 ]; then
        echo $folder
        exit 1
    fi

    local list=""
    for f in $(ls $folder); do
        # local name=$(bas$f)
        local version_cmd="$folder/$f/bin/python --version"
        # Weird thing here. python2 show his version using stderr
        # but pthon3 use the stdout
        local version=$(eval $version_cmd 2>&1)
        list="$list$f $version\n"
    done

    if [ -z "$list" ]; then
        echo "No environments availables"
        return 1
    fi

    echo $list | column -t
}


list_interpreters() {
    local python_path=""
    python_path=$(get_python_path)

    if [ $? == 1 ]; then
        echo $python_path
        exit 1
    fi

    basename $(ls -1 $python_path/python* | grep -v "config" | grep -v pythonw)
}


list_packages() {
    local folder
    folder=$(get_folder)

    if [ $? == 1 ]; then
        echo $folder
        exit 1
    fi

    local binary=$folder/$1/bin/pip

    if [ ! -f $binary ]; then
        echo "The environments $1 doesn't exists"
        exit 1
    fi
    eval "$binary list --format=columns"
}


activate_environment() {
    echo "Not implemented"
}


create_environment() {
    echo "Not implemented"
}


delete_environment() {
    echo "Not implemented"
}


run_as() {
    echo "Not implemented"
}

list_packages $1
