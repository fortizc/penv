source config.sh

list_environments() {
    local folder=""
    folder=$(get_folder)

    if [ $? == 1 ]; then
        echo $folder
        exit 1
    fi

    local list=""
    for f in $(ls $folder | cut -d "/" -f1); do
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

    echo -e $list | column -t
}


list_interpreters() {
    local python_path=""
    python_path=$(get_python_path)

    if [ $? == 1 ]; then
        echo $python_path
        exit 1
    fi

    local interpreters=$(ls -1 $python_path/python* |\
                        grep -v "config" |\
                        grep -v pythonw |\
                        cut -d "@" -f1)
    local result=""

    for intr in $interpreters; do
        local version=$(eval $intr --version 2>&1 | awk '{print $2}')
        intr=$(basename $intr)
        result="$result$intr $version\n"
    done
    echo -e $result | column -t
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
    local activate_cmd=$(get_folder)/$1/bin/activate

    if [ ! -f $activate_cmd ]; then
        echo "ERROR, the environment doesn't exist"
        exit 1
    else
         source $activate_cmd
    fi
}


create_environment() {
    local interpreter=$1
    local env_name=$2
    local folder=$(get_folder)

    local version=$(eval $interpreter --version 2>&1 |\
                    awk '{print $2}' | \
                    cut -d "." -f1)

    cd $folder
    if [ $version -lt 3 ]; then
        virtualenv -p $(which $interpreter) $env_name
    else
        $interpreter -m venv $env_name
    fi
    cd - > /dev/null 2>&1
}


delete_environment() {
    local folder=$(get_folder)
    local env_name=$1
    local delete=$folder/$env_name

    if [ ! -d $delete ]; then
        echo "ERROR, the environment doesn't exists"
        exit 1
    fi
    rm -rf $delete
}
