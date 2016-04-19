#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash
source_lib dot

main() {
  if [ "$1" != "plugin" ]; then
    [ "$ASSUME_YES" = "1" ] && uninstall && unset ASSUME_YES
    [ "$ASSUME_YES" != "1" ] && uninstall_message
    echo
  else
    uninstall_plugin
  fi
}

uninstall_message() {
  printf "Are you sure you want to continue (yes/no)? "; read ANSWER
  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" ) uninstall ;;
    * ) ;;
  esac
}

uninstall() {
  # Count up
  cprint "Check dotfiles" $UNDERLINE
  MAX=0
  MAX_F=0
  MAX_D=0
  BLUE="34"
  COLOR_75_B="1;38;5;75;49"
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    if [ -f ~/${DOT_NAME[$i]} ]; then
      MAX_F=$((MAX_F+1))
    elif [ -d ~/${DOT_NAME[$i]} ]; then
      MAX_D=$((MAX_D+1))
    fi
    ((MAX=MAX_F+MAX_D))
    cprintf " Total:" $COLOR_75_B; printf " %d " $MAX
    cprintf "(" $BLUE
    printf "%d directories, " $MAX_D
    printf "%d files" $MAX_F
    cprintf ")" $BLUE
    echo -e "\r\c"
  done
  echo -e '\n'

  # Remove
  cprint "Remove dotfiles" $UNDERLINE
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    if [ -e ~/${DOT_NAME[$i]} ]; then
      cprintf " [" $BLUE
      printf "%2d/%2d" $((i+1)) $MAX
      cprintf "] " $BLUE
      cprintf "Removing:" $COLOR_75_B
      printf " %s\n" ~/${DOT_NAME[$i]}
      unlink ~/${DOT_NAME[$i]}
    fi
  done
  rm -rf ~/.dotfiles ~/.zshenv.zwc
}

uninstall_plugin() {
  echo -e 'Remove plugins\n'
  rm -rf ~/.zsh/bundle/{.cache,*} ~/.vim/bundle/{.dein,*} ~/.tmux/plugins/*
}

main $@
