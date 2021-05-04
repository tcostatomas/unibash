#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

# Version check
if ((BASH_VERSINFO[0] < 4)); then
  echo "unibash: It appears you're running an older version of Bash."
  echo "unibash: You need at least Bash 4.x or some options might not work correctly."
  echo "unibash: Keep your software up-to-date!"
fi

export UNIBASH_ROOT=$(dirname "$BASH_SOURCE")
export UNIBASH=1

source "${UNIBASH_ROOT}/init.bashrc"
