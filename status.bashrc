#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

status_ps1() {
  # Receives the status code on $1
  local status=$1
  local color

  case $status in
    0) color='32' ;;
    *) color='31' ;;
  esac

  color="\e[1;${color}m"
  export UNIBASH_PS1="${UNIBASH_PS1} ${color}(${status})\e[0m"
}
