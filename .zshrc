fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit && compinit

export PATH=/bin:/usr/bin:/usr/local/bin:$PATH
export PATH=/Users/riley/bin:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Enables color for iTerm
export TERM=xterm-color

## Aliases
# Sets up proper alias commands when called
alias ls='ls -G'
alias lsl='ls -AGlph'
alias ll='ls -hl'
alias current-branch='git rev-parse --abbrev-ref HEAD'

# Delete merged branches
alias delete-merged='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias gd='git diff'
alias gdc='git dc'
alias dc='docker compose'
alias dcr='docker compose run --rm'
alias cleanup-containers='docker ps -f status=exited --format {{.ID}} | xargs docker rm'

