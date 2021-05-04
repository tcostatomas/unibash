#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: May 01, 2021
#

# For this to work, make sure the following is set
# conda config --set auto_activate_base False
# conda config --set changeps1 False

conda_ps1() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    export UNIBASH_PS1="(conda: ${CONDA_DEFAULT_ENV}) ${UNIBASH_PS1}"
  fi
}
