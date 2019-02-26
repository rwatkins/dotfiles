. ~/git-completion.bash
. ~/git-prompt.sh
# . ~/.cargo/env

export PATH=/Users/riley/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/riley/.cabal/bin:$PATH
export PATH=/Users/riley/.cargo/bin:$PATH
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH
export GREP_OPTIONS='--color=auto'

# Fix building rust/openssl
export OPENSSL_INCLUDE_DIR=/usr/local/Cellar/openssl/1.0.2k/include/
export DEP_OPENSSL_INCLUDE=/usr/local/Cellar/openssl/1.0.2k/include/

## Colors
# Enables color in the terminal bash shell export
CLICOLOR=1

# Sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

# Sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[01;32m\]\u\[\033[00m\] \[\033[01;36m\]\w\[\033[00m\]\[\033[0;35m\]\$(__git_ps1 ' %s')\[\033[0m\n❯ "

# Enables color for iTerm
export TERM=xterm-color

# FZF, ripgrep
# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
# 2018-07-22
#
# Source fzf key bindings (e.g. symlink to /usr/local/opt/fzf/shell/key-bindings.bash)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

## Aliases
# Sets up proper alias commands when called
alias ls='ls -G'
alias lsl='ls -AGlph'
alias ll='ls -hl'
alias current-branch='git rev-parse --abbrev-ref HEAD'

# Delete merged branches
alias delete-merged='git branch --merged | grep -v "\*" | grep -v master | grep -v development | xargs -n 1 git branch -d'

# Add GHC 7.8.4 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Vagrant
alias vup='cd ~/vagrant && vagrant up && cd -'
alias vsuspend='cd ~/vagrant && vagrant suspend && cd -'
alias vhalt='cd ~/vagrant && vagrant halt && cd -'

# Weather
alias weather='curl wttr.in'

# Postgres
alias start-postgres='postgres -D /usr/local/var/postgres/ -p 5432'

alias ag='ag --ignore-dir=public/assets --ignore-dir=deps'

gcoissue() {
    ISSUE=$1
    if [ -z "$ISSUE" ]; then
        echo 'Usage: gcoissue PCO-1234'
        return
    fi

    BRANCH=`git branch -a | grep -i "$ISSUE" | awk '{ print $1 }' | head -n1`
    if [ -z "$BRANCH" ]; then
        echo "No branch found: $1"
        return
    fi

    git checkout "$BRANCH"
}

# API keys and such
# . ~/.keys
