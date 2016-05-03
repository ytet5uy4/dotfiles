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
    local string="$1"
    local color="\e[${2}m"
    local reset="\e[0;39;49m"
    print "${color}${string}${reset}"
  }

  cprintf() {
    local string="$1"
    local color="\e[${2}m"
    local reset="\e[0;39;49m"
    printf "${color}${string}${reset}"
  }

  source_lib() {
    local file="$1"
    local arg="$2"
    local dir="$HOME/.dotfiles/tools/lib"
    source ${dir}/${file}.bash $arg
  }

  source_dotool() {
    local file="$1"
    local arg="$2"
    local dir="$HOME/.dotfiles/tools"
    source ${dir}/${file}.bash $arg
  }

  INCLUDE_GUARD_BASE="1"
fi
