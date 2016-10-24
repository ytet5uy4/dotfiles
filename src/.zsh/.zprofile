. $ZDOTDIR/lib/init.zsh set

if is-arch || is-alpine; then
  . ~/.zshenv && . $ZDOTDIR/lib/init.zsh set
fi

: "Launch tmux" && () {
  if has tmux && [[ -z $TMUX ]]; then
    if [[ $USER = wemux ]]; then
      wemux
    else
      exec tmux-exec
    fi
  fi
}

: "Display LastLogin" && () {
  if has lastlog && [[ -f /var/log/lastlog ]]; then
    set -- `last -R | sed -n 2p`
    private port="$2" date="$3 $4 $5 $6" on=`print-color-bold 'on' "$fg[accent]"`
    print-section 'LastLogin' "$date $on $port"
  fi
}

: 'Catenate configuration files of zsh' && () {
  private -a file
  file=( $ZDOTDIR/rc/{plugins,base,aliases,completion,prompt,local}.zsh )

  for f in $file; do
    if [[ ! -f $ZDOTDIR/.zshrc || $f -nt $ZDOTDIR/.zshrc ]]; then
      print-header 'Catenate configuration files of zsh'
      private mark=`print-color-bold '>' "$fg[accent]"`
      print " $ZDOTDIR/rc/* $mark $ZDOTDIR/.zshrc"
      private initialize='. $ZDOTDIR/lib/init.zsh set'
      private finalize='. $ZDOTDIR/lib/init.zsh unset'
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

. $ZDOTDIR/lib/init.zsh unset
