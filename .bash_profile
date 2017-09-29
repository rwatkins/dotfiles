. ~/git-completion.bash
. ~/git-prompt.sh
. ~/.cargo/env

export PATH=/Users/riley/bin:$PATH
export PATH=/Users/rileywatkins/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/riley/.cabal/bin:$PATH
export PATH=/Users/riley/.cargo/bin:$PATH
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH
export GREP_OPTIONS='--color=auto'

# Fix building rust/openssl
export OPENSSL_INCLUDE_DIR=/usr/local/Cellar/openssl/1.0.2k/include/
export DEP_OPENSSL_INCLUDE=/usr/local/Cellar/openssl/1.0.2k/include/

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[01;32m\]\u\[\033[00m\] \[\033[01;36m\]\w\[\033[00m\]\[\033[0;35m\]\$(__git_ps1 ' %s')\[\033[0m\n❯ "
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias lsl='ls -AGlph'
alias ll='ls -hl'

# Delete merged branches
alias delete-merged='git branch --merged | grep -v "\*" | grep -v master | grep -v development | xargs -n 1 git branch -d'

# Add GHC 7.8.4 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

. /usr/local/share/chruby/chruby.sh
chruby 2.3.0

# Vagrant
alias vup='cd ~/vagrant && vagrant up && cd -'
alias vsuspend='cd ~/vagrant && vagrant suspend && cd -'
alias vhalt='cd ~/vagrant && vagrant halt && cd -'

# Weather
alias weather='curl wttr.in'

# Postgres
alias start-postgres='postgres -D /usr/local/var/postgres/ -p 5432'

alias ag='ag --ignore-dir=public/assets'

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
. ~/.keys
