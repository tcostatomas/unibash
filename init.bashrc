#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

source "${UNIBASH_ROOT}/aliases.bashrc"
source "${UNIBASH_ROOT}/conda.bashrc"
source "${UNIBASH_ROOT}/git.bashrc"
source "${UNIBASH_ROOT}/status.bashrc"
source "${UNIBASH_ROOT}/virtualenv.bashrc"

__usr='\e[1;34m\u\e[0m'
__dir=' \e[90min \e[1;33m\w\e[0m'
__prompt='\n$ '

__chps1() {
  status=$?

  # Build PS1
  export UNIBASH_PS1="${__usr}${__dir}"

  # The following plugins change the status line
  git_ps1
  status_ps1 $status
  virtualenv_ps1
  conda_ps1

  # Append prompt and export PS1
  export PS1="${UNIBASH_PS1}${__prompt}"
}

PROMPT_COMMAND=__chps1
