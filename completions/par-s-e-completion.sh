# par-s-e completion for Bash and Zsh

_parse_complete() {
    local cur prev repo_dir commands scripts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Available subcommands
    commands="list install update uninstall catalog help"

    # If completing the first argument (subcommand)
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${commands}" -- "${cur}") )
        return 0
    fi

    case "$prev" in
        list)
            COMPREPLY=( $(compgen -W "${commands}" -- "${cur}") )
            return 0
            ;;
        install)
            repo_dir=$(readlink -f "$(command -v par-s-e)")
            repo_dir=$(dirname "$repo_dir")
            scripts=$(ls "$repo_dir/scripts" 2>/dev/null)
            COMPREPLY=( $(compgen -W "${scripts}" -- "${cur}") )
            return 0
            ;;
        update|uninstall)
            if [[ -f "$HOME/.par-s-e/installed.db" ]]; then
                scripts=$(cut -f1 "$HOME/.par-s-e/installed.db")
                COMPREPLY=( $(compgen -W "${scripts}" -- "${cur}") )
            fi
            return 0
            ;;
    esac
}

# Register completion
if [[ -n ${ZSH_VERSION-} ]]; then
    autoload -U +X bashcompinit && bashcompinit
    complete -F _parse_complete par-s-e
elif [[ -n ${BASH_VERSION-} ]]; then
    complete -F _parse_complete par-s-e
fi
