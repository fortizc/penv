source "env_wrapper.sh"

help() {
    echo "Usage $1 {options}:"
    echo ""
    echo "Arguments:"
    echo "-l, --list\t\t\t\tList all availables environments"
    echo "-p, --packages {environment}\t\tShow instaled packages"
    echo "-a, --activate {environment}\t\tActivate the given environment"
    echo "-c, --create {python_version} {name}\tCreate a new environment"
    echo "-i, --interpreter\t\t\tShow all availables interpreters"
    echo "-d, --delete {environment}\t\tDelete the given environment"
    echo "-h, --help\t\t\t\tShow this help and exit"

}

case "$1" in
    --list | -l)
        list_environments
        ;;
    --packages | -p)
        list_packages $2
        ;;
    --activate | -a)
        activate_environment $2
        ;;
    --create | -c)
        create_environment $2 $3
        ;;
    --interpreter | -i)
        list_interpreters
        ;;
    --delete | -d)
        delete_environment $2
        ;;
    --help | -h)
        help $0
        ;;
    *)
        help $0
        ;;
esac
