# .bash_profile

# User specific environment and startup programs

export JAVA_HOME=$(/usr/libexec/java_home)
export GOPATH=$HOME/go

PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/bin

alias ls='ls -G'
alias ll='ls -l'
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

source ~/BashPlugins/git-completion.bash

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp

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
    PS1="`_git_prompt`"'\$\h \t \W |$ '
}

PROMPT_COMMAND=_prompt_command

