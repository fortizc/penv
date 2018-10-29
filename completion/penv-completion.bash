#!/usr/bin/env bash

penv_completion() {
    prev_arg="${COMP_WORDS[COMP_CWORD-1]}";
    curr_arg="${COMP_WORDS[COMP_CWORD]}";
    if [[ "$prev_arg" == "-a" || "$prev_arg" == "--activate" || "$prev_arg" == "-d" || "$prev_arg" == "--delete" ]]; then
        local sug=($(compgen -W "$(penv -l| cut -d " " -f 1)" "${COMP_WORDS[2]}"))

        if [ "${#sug[@]}" == "1" ]; then
            local envi=$(echo ${sug[0]/%\ */})
            COMPREPLY=("$envi")
        else
            COMPREPLY=("${sug[@]}")
        fi
    elif [[ ("$prev_arg" == "-c" || "$prev_arg" == "--create") ]]; then
        local sug=($(compgen -W "$(penv -i| cut -d " " -f 1)" "${COMP_WORDS[2]}"))

        if [ "${#sug[@]}" == "1" ]; then
            local py=$(echo ${sug[0]/%\ */})
            COMPREPLY=("$py")
        else
            COMPREPLY=("${sug[@]}")
        fi
    fi
}

complete -F penv_completion penv
