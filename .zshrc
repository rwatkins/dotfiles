fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit && compinit

autoload -U select-word-style
select-word-style bash

export PATH="/usr/local/bin:/bin:/usr/bin:$PATH"
export PATH="/Users/riley/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Enables color for iTerm
export TERM=xterm-color

# Nodenv
eval "$(nodenv init -)"

## Aliases
# Sets up proper alias commands when called
alias ls='ls -G'
alias lsl='ls -AGlph'
alias ll='ls -hl'
alias current-branch='git rev-parse --abbrev-ref HEAD'
alias short-sha='git rev-parse --short HEAD'

# Delete merged branches
alias delete-merged='git branch --merged | grep -v "\*" | grep -v master | grep -v main | xargs -n 1 git branch -d'
alias gd='git diff'
alias gdc='git dc'
alias dc='docker compose'
alias dcr='docker compose run --rm'
alias cleanup-containers='docker ps -f status=exited --format {{.ID}} | xargs docker rm'
alias show-deploys="ssh admin-3 'ls -l /tmp/ | grep -e build-\w+$'"

# Set up nodenv
eval "$(nodenv init -)"
alias work='cd ~/workstep/workstep'

# Set up asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

#export HOMEBREW_NO_AUTO_UPDATE=1
export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

# opam configuration
[[ ! -r /Users/riley/.opam/opam-init/init.zsh ]] || source /Users/riley/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
