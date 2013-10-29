### Preserve history across sessions
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
