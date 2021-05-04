#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

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
