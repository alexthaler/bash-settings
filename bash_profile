alias subl='open -a /Applications/Sublime\ Text\ 2.app/'
alias ls='ls -G'
alias ll='ls -l'

source ~/BashPlugins/git-completion.bash

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}

function _prompt_command() {
    PS1="`_git_prompt`"'\$\h \t \W ➙ \[\e \[\e[0m\]'
}

PROMPT_COMMAND=_prompt_command

