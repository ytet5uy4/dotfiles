. ~/.local/lib/zsh/init.zsh

if is-arch; then
  . ~/.zshenv && . ~/.local/lib/zsh/init.zsh
fi

: "Launch tmux" && () {
  if has tmux && [[ -z $TMUX ]]; then
    exec mux-loader
  fi
}

: "Install tmux plugins" && () {
  if [[ ! -d $TPM_HOME ]] && [[ ! -f $TMUX_CACHE_HOME/plugin ]]; then
    touch $TMUX_CACHE_HOME/plugin
    tmux confirm-before -p 'Do you install tmux plugins?' "run-shell 'tmux-plugin-init'"
    tpm-init
  fi
}

: 'Catenate configuration files of zsh' && () {
  private -a file
  file=( $ZDOTDIR/rc/{plugins,base,aliases,completion}.zsh )
  [[ -f $ZDOTDIR/rc/local.zsh ]] && file+=$ZDOTDIR/rc/local.zsh

  for f in $file; do
    if [[ ! -f $ZDOTDIR/.zshrc || $f -nt $ZDOTDIR/.zshrc ]]; then
      print-header 'Catenate configuration files of zsh'
      private mark=`print-color-bold '>' "$fg[accent]"`
      print " $ZDOTDIR/rc/* $mark $ZDOTDIR/.zshrc"
      private initialize='. ~/.local/lib/zsh/init.zsh set'
      private finalize='. ~/.local/lib/zsh/init.zsh unset'
      cat <(<<< $initialize) $file <(<<< $finalize) > $ZDOTDIR/.zshrc
      return 0
    fi
  done
}

: "Compile configuration files of zsh" && () {
  private -a file
  file=( ~/.zshenv $ZDOTDIR/.z{profile,shrc} )

  # Check
  private i N
  i=0
  for f in $file; do
    if [[ ! -f $f.zwc || $f -nt $f.zwc ]]; then
      ((i=i+1))
    fi
  done
  N=$i

  # Start
  if (( $N )); then
    i=1
    print-header 'Compile configuration files of zsh'
    for f in $file; do
      if [[ ! -f $f.zwc || $f -nt $f.zwc ]]; then
        printf ' '
        print-log "$i" "$N" 'Compile' "$f"
        zcompile $f
        ((i=i+1))
      fi
    done
  fi
}
