source /usr/local/bin/virtualenvwrapper.sh
source ~/git-completion.bash
source ~/git-prompt.sh
export PATH=/Users/riley/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/riley/.cabal/bin:$PATH
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH
export GREP_OPTIONS='--color=auto'

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;36m\]\w\[\033[00m\]\[\033[0;35m\]\$(__git_ps1 ' %s')\[\033[0m\n\$ "
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'

# Add GHC 7.8.4 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

