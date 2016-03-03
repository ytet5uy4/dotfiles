#!/bin/bash

RET=$(echo -e "halt\nreboot\nlogout" | dmenu -nb black -fn 'Migu 1M:size=13.5' -p "Power")

case $RET in
  halt) halt -p ;;
  reboot) reboot ;;
  logout) xdotool key "super+shift+q" ;;
  *) ;;
esac