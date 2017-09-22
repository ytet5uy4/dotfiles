[ -e /etc/arch-release ] && . ~/.zshenv

# Launch xmonad
if [[ $XDG_VTNR = 1 ]] && [[ -z $DISPLAY ]]; then
 exec startx >/dev/null 2>&1
fi

# Launch tmux
if type tmux >/dev/null 2>&1 && [[ -z $TMUX ]]; then
  exec mux-loader
fi

: "Install tmux plugin manager" && () {
  private -A dir
  dir=(
    plugin "$TMUX_PLUGIN_MANAGER_PATH"
    cache  "$XDG_DATA_HOME/tmux/plugins"
  )
  if [[ ! -d $dir[plugin] ]] && [[ ! -f $dir[cache]/confirmed ]]; then
    mkdir -p "$dir[cache]"
    touch "$dir[cache]/confirmed"
    tmux confirm-before -p 'Do you install plugin manager?' "run-shell '
      git clone https://github.com/tmux-plugins/tpm $dir[cache]/tpm
      tmux display \"Installed tmux plugins\"
    '"
  fi
}
