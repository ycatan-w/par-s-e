#!/bin/bash

oneup() {
  case "$1" in
  start)
    if [ -n "$OLD_PS1" ]; then
      echo "Already started"
      return 0
    fi
    local BIN_DIR=$(pwd)/bin
    local SCRIPT_DIR=$(pwd)/scripts
    export OLD_PS1="$PS1"
    export OLD_PATH="$PATH"
    export PATH="$BIN_DIR:$SCRIPT_DIR:$PATH"
    export PS1="\[\033[94m\][🍄]\[\033[00m\]${PS1//\\n/\\n\[\033[94m\][🍄]\[\033[00m\]}"
    ;;
  stop)
    if [ -z "$OLD_PS1" ]; then
      return
    fi
    export PATH="$OLD_PATH"
    export PS1="$OLD_PS1"
    unset OLD_PATH OLD_PS1
    ;;
  *)
    echo "Usage: oneup {start|stop}"
    ;;
  esac
}
alias 1up=oneup
