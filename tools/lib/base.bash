#!/bin/bash

: ${INCLUDE_GUARD_BASE:=0}

if [ "$INCLUDE_GUARD_BASE" = "0" ]; then
  has() { type $1 >/dev/null 2>&1; }

  print() { printf "$@\n"; }

  BLUE="34"
  RED_B="1;31;49"
  CYAN_B="1;36;49"
  UNDERLINE="4;39;49"
  COLOR_46_B="1;38;5;46;49"
  COLOR_75_B="1;38;5;75;49"
  COLOR_93_B="1;38;5;93;49"

  cprint() {
    local readonly string="$1" color="\e[${2}m" reset="\e[0;39;49m"
    print "${color}${string}${reset}"
  }

  cprintf() {
    local readonly string="$1" color="\e[${2}m" reset="\e[0;39;49m"
    printf "${color}${string}${reset}"
  }

  source_lib() {
    local readonly file="$1" arg="${@:2}" dir="$HOME/.dotfiles/tools/lib"
    source ${dir}/${file}.bash $arg
  }

  source_dotool() {
    local readonly file="$1" arg="$2" dir="$HOME/.dotfiles/tools"
    source ${dir}/${file}.bash $arg
  }

  lprintf() {
    local readonly MAIN_COLOR='\e[1;38;5;32;49m'
    local readonly COLOR_RESET='\e[0;39;49m'
    local readonly SUCCESS_COLOR='1;36;49'
    local readonly ERROR_COLOR='1;31;49'
    local readonly MSG="$1" CMD="${@:2}"
    $CMD >/dev/null 2>&1 &
    while :; do
      jobs %1 > /dev/null 2>&1 || break
      printf "\r%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" ".  "
      sleep 0.7
      jobs %1 > /dev/null 2>&1 || break
      printf "\r%s%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" "." ". "
      sleep 0.7
      jobs %1 > /dev/null 2>&1 || break
      printf "\r%s%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" ".." "."
      sleep 0.7
    done
    if wait $!; then
      printf "\r${MSG}..."
      cprint 'done' "$SUCCESS_COLOR"
      return 0
    else
      printf "\r${MSG}..."
      cprint 'error' "$ERROR_COLOR"
      return 1
    fi
  }

  INCLUDE_GUARD_BASE="1"
fi
