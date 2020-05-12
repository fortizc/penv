#!/usr/bin/env bash

penv_completion() {
    prev_arg="${COMP_WORDS[COMP_CWORD-1]}";
    curr_arg="${COMP_WORDS[COMP_CWORD]}";

    # echo "${COMP_WORDS[2]}"

    if [[ "$prev_arg" == "-a" || "$prev_arg" == "--activate" ||\
          "$prev_arg" == "-d" || "$prev_arg" == "--delete" ||\
          "$prev_arg" == "-C" || "$prev_arg" == "--clean" ]]; then
        local sug=($(compgen -W "$(penv -l| cut -d " " -f 1)" "$curr_arg"))

        if [ "${#sug[@]}" == "1" ]; then
            local envi=$(echo ${sug[0]/%\ */})
            COMPREPLY=("$envi")
        else
            COMPREPLY=("${sug[@]}")
        fi
    elif [[ "$prev_arg" == "-c" || "$prev_arg" == "--create" ]]; then
        local sug=($(compgen -W "$(penv -i| cut -d " " -f 1)" "$curr_arg"))

        if [ "${#sug[@]}" == "1" ]; then
            local py=$(echo ${sug[0]/%\ */})
            COMPREPLY=("$py")
        else
            COMPREPLY=("${sug[@]}")
        fi

    elif [[ "$prev_arg" == "penv" ]]; then
        COMPREPLY=($(compgen -W "--list --packages --activate --create --interpreter --delete --clean --version --help" "${curr_arg//-/\\\-}"))
    fi
}

complete -F penv_completion penv
