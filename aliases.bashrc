#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

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

# Allow sudo to be used on aliases
alias sudo='sudo '
