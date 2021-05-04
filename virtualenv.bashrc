#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: July 24, 2018
#

virtualenv_ps1() {
  local name
  if [ -n "$VIRTUAL_ENV" ]; then
    # Strip the path and leave the environment name
    name="${VIRTUAL_ENV##*/}"
    export UNIBASH_PS1="(venv: ${name}) ${UNIBASH_PS1}"
  fi
}

# Disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1
