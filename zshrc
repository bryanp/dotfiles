export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:/usr/local/sbin:$PATH"
export EDITOR='vim'
eval "$(rbenv init -)"

export PATH="./bin:$PATH"
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

kapow() { bin/kapow "$@"; }

alias pakdev='/users/bryanp/code/ruby/gems/pakyow/pakyow-core/bin/pakyow'
#pakdev() { /users/bryanp/code/ruby/gems/pakyow/pakyow-core/bin/pakyow "$@"; }

# Don't check mail when opening terminal.
unset MAILCHECK

autoload -U colors && colors


# function git_prompt_info() {
#   ref=$(git symbolic-ref HEAD 2> /dev/null) || \
#   ref=$(git rev-parse --short HEAD 2> /dev/null) || return
#   echo "${ref#refs/heads/}$(parse_git_dirty)"
# }

# # Checks if working tree is dirty
# parse_git_dirty() {
#   local SUBMODULE_SYNTAX=''
#   if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
#     if [[ $POST_1_7_2_GIT -gt 0 ]]; then
#           SUBMODULE_SYNTAX="--ignore-submodules=dirty"
#     fi
#     if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
#       echo "*"
#     else
#       echo ""
#     fi
#   fi
# }

# PROMPT="%c [$(git_prompt_info)] $ "

setopt prompt_subst
autoload colors zsh/terminfo
colors
 
function __git_prompt {
  local DIRTY="%{$fg[yellow]%}"
  local CLEAN="%{$fg[green]%}"
  local UNMERGED="%{$fg[red]%}"
  local RESET="%{$terminfo[sgr0]%}"
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    echo -n "["
    if [[ `git ls-files -u >& /dev/null` == '' ]]
    then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]]
      then
        echo -n $DIRTY
      else
        git diff --cached --quiet >& /dev/null
        if [[ $? == 1 ]]
        then
          echo -n $DIRTY
        else
          echo -n $CLEAN
        fi
      fi
    else
      echo -n $UNMERGED
    fi
    echo -n `git branch | grep '* ' | sed 's/..//'`
    echo -n $RESET
    echo -n "]"
  fi
}
 
export RPS1='$(__git_prompt)'

PROMPT="%c $ "

