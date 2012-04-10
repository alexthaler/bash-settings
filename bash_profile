alias etet='echo this is a test'
alias python='python2.5'
alias webopen='open -a Google\ Chrome'
alias ls='ls -G'

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

##
# Your previous /Users/laughingman234/.bash_profile file was backed up as /Users/laughingman234/.bash_profile.macports-saved_2011-03-16_at_14:46:46
##

# MacPorts Installer addition on 2011-03-16_at_14:46:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=~/scala/bin:$PATH
export AC_DIFF_CLI="vimdiff %1 %2"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
PATH="~/go/bin:${PATH}"
PATH="/Developer/usr/bin:${PATH}"
PATH="~/Frameworks/play-2.0:${PATH}"
export PATH
