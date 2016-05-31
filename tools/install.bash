#!/bin/bash

main() {
  set_color_var
  if [ "$1" != "plugin" ]; then
    print_header
    if [ "$ASSUME_YES" = "1" ]; then
      install && unset ASSUME_YES
    else
      install_message
    fi
  else
    install_plugin
  fi
  if [ "$ASSUME_YES" = "1" ]; then
    restart && unset ASSUME_YES
  else
    restart_message
  fi
  unset_color_var
}

print_header() {
  clear
  # http://patorjk.com/software/taag/#p=display&h=1&f=Slant&t=dotfiles
  printf "\n$MAIN_COLOR"
  echo '          __        __   ____ _  __              '
  echo '     ____/ /____   / /_ / __/(_)/ /___   _____   '
  echo '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo '   / /_/ // /_/ // /_ / __// // //  __/(__  )    '
  echo '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf "$COLOR_RESET\n"
  cprint '                   github.com/ytet5uy4/dotfiles   \n' "$DARKGRAY"
  cprintf '   Author: '  "$SUB_COLOR"; printf 'ytet5uy4'
  cprintf '   License: ' "$SUB_COLOR"; echo   'MIT'
  cprintf '   Full Installation: ' "$SUB_COLOR"
  [ "$FULL_INSTALLATION" = "1" ] && cprint 'enable' "$MAIN_COLOR" || print 'disable'
  cprintf '   Option Assume yes: ' "$SUB_COLOR"
  [ "$ASSUME_YES" = "1" ] && cprint 'enable' "$MAIN_COLOR" || print 'disable'
  echo
}

install_message() {
  echo '   If the file exists, it will be ruthlessly clobbered'
  printf '   Are you sure you want to continue (yes/no)? '; read ANSWER; echo
  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" ) install ;;
    * ) exit 0 ;;
  esac
}

install() {
  # Start install
  cprint "Download dotfiles" $UNDERLINE
  ## Check git command
  printf " Checking git command..."
  if has git; then
    cprint "done" $SUCCESS_COLOR
  else
    cprint "error" $ERROR_COLOR
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi

  ## Download
  printf " Downloading dotfiles..."
  DOTFILES_REPO='https://github.com/ytet5uy4/dotfiles.git'
  { sleep 1; git clone $DOTFILES_REPO ~/.dotfiles; } | LESS='-cE' less
  cprint "done\n" $SUCCESS_COLOR

  # Backup
  . ~/.dotfiles/tools/backup.bash

  # Deploy
  . ~/.dotfiles/tools/deploy.bash

  # Install plugin
  [ "$FULL_INSTALLATION" = "1" ] && install_plugin && unset FULL_INSTALLATION
}

restart_message() {
  printf "Do you want to restart shell (yes/no)? "; read ANSWER
  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" ) restart ;;
    * ) echo ;;
  esac
}

restart() { clear; exec $SHELL -l; }

install_plugin() {
  cprint "Install plugin" $UNDERLINE

  local readonly NAME=('Dein' 'Zplug' 'TPM')
  local readonly REPO=('Shougo/dein.vim' 'b4b4r07/zplug' 'tmux-plugins/tpm')
  local readonly GITHUB_URL='https://github.com/'
  local readonly DIR=(
    '.vim/bundle/repos/github.com/Shougo/dein.vim'
    '.zsh/bundle/zplug'
    '.tmux/plugins/tpm'
  )

  printf " Downloading ${NAME[*]}..."
  _IFS="$IFS" IFS=$'\n'
  paste -d ' ' <(echo "${REPO[*]}") <(echo "${DIR[*]}") \
    | sed -e "s|^|${GITHUB_URL}|g" \
    | xargs -L 1 -n 2 -P 3 git clone >/dev/null 2>&1
  IFS="$_IFS"
  cprint "done\n" $SUCCESS_COLOR
}

has() { type $1 >/dev/null 2>&1; }

print() { printf "$@\n"; }

set_color_code() { echo "\e[${1}m"; }

set_color_var() {
  MAIN_COLOR="$(set_color_code '1;38;5;32;49')"
  SUB_COLOR="$(set_color_code '1;38;5;75;49')"
  SUCCESS_COLOR="$(set_color_code '1;36;49')"
  ERROR_COLOR="$(set_color_code '1;31;49')"
  UNDERLINE="$(set_color_code '4;39;49')"
  DARKGRAY="$(set_color_code '90')"
  COLOR_RESET="$(set_color_code '0;39;49')"
}

unset_color_var() {
  unset MAIN_COLOR SUB_COLOR
  unset SUCCESS_COLOR ERROR_COLOR
  unset UNDERLINE
  unset DARKGRAY
  unset COLOR_RESET
}

cprint() { print "${2}${1}${COLOR_RESET}"; }

cprintf() { printf "${2}${1}${COLOR_RESET}"; }

main $@
