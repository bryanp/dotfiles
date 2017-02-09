### paths
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
###

### NODE
export PATH="$HOME/.node/bin:$PATH"

### NPM
# export PATH="/usr/local/share/npm/bin:$PATH"

### PYTHON
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

### NVM
# ugh this is so slow
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

export EDITOR='vim'

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
##

### kubernetes
export KUBECONFIG=~/code/ops/kubernetes/.kube/config
export PATH=~/code/ops/kubernetes/platforms/darwin/amd64:$PATH
export KUBERNETES_PROVIDER=aws
##

## chruby
 # source /usr/local/opt/chruby/share/chruby/chruby.sh
 # source /usr/local/opt/chruby/share/chruby/auto.sh
 # chruby 2.2.2
##

### prioritize binstubs
export PATH="./bin:$PATH"
###

### aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# kapow() { bin/kapow "$@"; }

alias pakdev='/users/bryanp/code/pakyow/libs/pakyow/bin/pakyow'
alias kapdev='../../gems/kapow/bin/kapow'

alias ta='tmux attach'
###

### no mail check
unset MAILCHECK
###

### tmux
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function proml {

  local        BLUE="\[\033[0;34m\]"

# OPTIONAL - if you want to use any of these other colors:

  local         RED="\[\033[0;31m\]"

  local   LIGHT_RED="\[\033[1;31m\]"

  local       GREEN="\[\033[0;32m\]"

  local LIGHT_GREEN="\[\033[1;32m\]"

  local       WHITE="\[\033[1;37m\]"

  local  LIGHT_GRAY="\[\033[0;37m\]"

# END OPTIONAL

  local     DEFAULT="\[\033[0m\]"

  PS1="\W \$(parse_git_branch) $DEFAULT\$ "
}

proml

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias tmux="TERM=screen-256color-bce tmux"
###

### bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi
###

### dailies
export DAILY_KEY="ead9deb285c4574fa5d6f468430696"
export DAILY_PATH="/users/bryanp/code/wiki/devlog"

### use macvim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

CVSROOT=:pserver:metabahn@10.200.0.14:/usr/local/cvsroot; export CVSROOT

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias jim=gem

# added by travis gem
[ -f /Users/bryanp/.travis/travis.sh ] && source /Users/bryanp/.travis/travis.sh
