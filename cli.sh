#!/bin/bash

source "env_wrapper.sh"

help() {
    echo -e "Usage $1 {options}:"
    echo -e ""
    echo -e "Arguments:"
    echo -e "-l, --list\t\t\t\tList all availables environments"
    echo -e "-p, --packages {environment}\t\tShow instaled packages"
    echo -e "-a, --activate {environment}\t\tActivate the given environment"
    echo -e "-c, --create {python_version} {name}\tCreate a new environment"
    echo -e "-i, --interpreter\t\t\tShow all availables interpreters"
    echo -e "-d, --delete {environment}\t\tDelete the given environment"
    echo -e "-h, --help\t\t\t\tShow this help and exit"

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
