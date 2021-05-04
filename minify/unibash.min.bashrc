#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: May 04, 2021
#

if ((BASH_VERSINFO[0] < 4)); then
  echo "unibash: It appears you're running an older version of Bash."
  echo "unibash: You need at least Bash 4.x or some options might not work correctly."
  echo "unibash: Keep your software up-to-date!"
fi

export UNIBASH_ROOT=$(dirname "$BASH_SOURCE")
export UNIBASH=1

if ls --color -d . &> /dev/null; then
  alias ls='ls --color=auto'
elif ls -G -d . &> /dev/null; then
  alias ls='ls -G'
fi

alias l='ls -l'
alias ll='ls -al'
alias lh='ls -hl'
alias llh='ls -ahl'

if grep --color=auto '' <<< '' &> /dev/null; then
  alias grep='grep -n --color=auto'
  export GREP_COLOR='1;31'
fi

alias sudo='sudo '

conda_ps1() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    export UNIBASH_PS1="(conda: ${CONDA_DEFAULT_ENV}) ${UNIBASH_PS1}"
  fi
}

__is_git() {
  if command git rev-parse --show-toplevel &> /dev/null; then
    return 0
  fi

  return 1
}

__is_git_dirty() {
  if [ -n "$(command git status --short)" ]; then
    return 0
  fi

  return 1
}

git_ps1() {
  if __is_git; then
    local branch=$(command git symbolic-ref --short --quiet HEAD)
    branch=${branch:-HEAD}
    if __is_git_dirty; then
      branch="${branch}*"
    fi

    export UNIBASH_PS1="${UNIBASH_PS1} \e[90mon \e[1;35m${branch}\e[0m"
  fi
}

status_ps1() {
  local status=$1
  local color

  case $status in
    0) color='32' ;;
    *) color='31' ;;
  esac

  color="\e[1;${color}m"
  export UNIBASH_PS1="${UNIBASH_PS1} ${color}(${status})\e[0m"
}

virtualenv_ps1() {
  local name
  if [ -n "$VIRTUAL_ENV" ]; then
    name="${VIRTUAL_ENV##*/}"
    export UNIBASH_PS1="(venv: ${name}) ${UNIBASH_PS1}"
  fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

__usr='\e[1;34m\u\e[0m'
__dir=' \e[90min \e[1;33m\w\e[0m'
__prompt='\n$ '

__chps1() {
  status=$?

  export UNIBASH_PS1="${__usr}${__dir}"

  git_ps1
  status_ps1 $status
  virtualenv_ps1
  conda_ps1

  export PS1="${UNIBASH_PS1}${__prompt}"
}

PROMPT_COMMAND=__chps1
