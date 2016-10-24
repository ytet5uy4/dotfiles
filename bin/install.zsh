#!/bin/zsh

typeset -g D{USER,AUTHOR,LICENSE}
: ${DUSER:=ytet5uy4}
: ${DAUTHOR:=${DUSER}} ${DLICENSE:=MIT}

# dctl
export D{REPO,ROOT,PATH,TARGET}
: ${DREPO:=https://github.com/${DUSER}/dotfiles}
: ${DROOT:=~/.config/dotfiles}
: ${DPATH:="$DROOT/src"}
: ${DTARGET:="$DPATH/.{,config/}*"}

# color
typeset -gA fg=(
  default   ''
  main      "${DMAINCOLOR:=75}"
  sub       "${DSUBCOLOR:=240}"
  accent    "${DACCENTCOLOR:=21}"
  success   "${DSUCCESSCOLOR:=32}"
  error     "${DERRORCOLOR:=129}"
)

typeset -gA bg=(
  default ''
)

typeset -gA text=(
  fg '38'
  bg '48'
)

typeset -gA attr=(
  default   '0'
  bold      '1'
  underline '4'
  reverse   '7'
)

# others
typeset -g TEMPDIR="`mktemp -d /tmp/dotfiles-XXXXXX`"
typeset -g TEMPDIR_DCTL="$TEMPDIR/dctl"

typeset -gA opt
while (( $# > 0 )); do
  case "$1" in
    -*)
      [[ "$1" =~ 'y' ]] && opt[yes]='1'
      shift
      ;;
    *) shift ;;
  esac
done

main() {
  print-info

  # check git command
  if ! type git >/dev/null 2>&1; then
    echo '   Please install git or update your path to run git command'
    exit 1
  fi

  if (( $opt[yes] )); then
    install
  else
    private comment msg
    comment='If the file exists, it will be ruthlessly clobbered'
    msg='Are you sure you want to continue'
    print-prompt "$msg" 'install' "$comment" '   '
  fi
}

print-info() {
  clear
  private color="\e[$attr[bold];$text[fg];5;$fg[main]m"
  private reset="\e[0m"

  printf  "\n$color"
  echo    '          __        __   ____ __ __              '
  echo    '     ____/ /____   / /_ / __//_// /___   _____   '
  echo    '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo    '   / /_/ // /_/ // /_ / __// // //  __//__  /    '
  echo    '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf  "$reset\n"

  print-color-bold  "           $DREPO   \n" "$fg[sub]"

  printf-section 'Author' "$DAUTHOR" '   '
  print-section 'License' "$DLICENSE" '     '

  echo
}

print-prompt() {
  printf-color-bold "$4? " "$fg[main]"
  [[ $3 ]] && printf "$3\n$4  "
  printf "$1? %s " "`print-brackets Y/n`"
  read -q input
  [[ $3 ]] && printf "\r$4  " || printf-color-bold "\r$4? " "$fg[main]"
  printf "$1? %s " "`print-brackets Y/n`"
  case $input in
    y )
      print-color 'Yes\n' "$fg[main]"
      $=2
      ;;
    * )
      print-color 'no\n' "$fg[main]"
      exit 0
      ;;
  esac
}

print-brackets() {
  if [[ $1 = Y/n ]]; then
    printf-color-bold '[' "$fg[sub]"
    printf-color 'Y' "$fg[main]" "$attr[underline]"
    printf-color '/' "$fg[main]"
    printf-color 'n' "$fg[main]" "$attr[underline]"
    printf-color-bold ']' "$fg[sub]"
  else
    printf-color-bold '[' "$fg[accent]"
    printf '%s' "$1"
    printf-color-bold ']' "$fg[accent]"
  fi
}

print-section() {
  printf '%s' "$3"
  printf-color-bold "${(r:1:)1}" "$fg[main]"
  printf-color "${(l:(($#1-1)):)1}" "$fg[main]"
  printf-color-bold ': ' "$fg[sub]"
  printf '%s\n' "$2"
}

printf-section() {
  printf '%s' "$3"
  printf-color-bold "${(r:1:)1}" "$fg[main]"
  printf-color "${(l:(($#1-1)):)1}" "$fg[main]"
  printf-color-bold ': ' "$fg[sub]"
  printf '%s' "$2"
}

install() {
  # Download dctl
  download dctl

  # Source dctl and install dotfiles with dctl
  . "$TEMPDIR_DCTL/init.zsh" && dctl -i

  # Restart
  if [[ $SHELL:t = zsh ]]; then
    clear
    $SHELL -l
  fi
}

download() {
  if [[ $1 = dctl ]];then
    typeset repo_dctl="https://github.com/$DUSER/dctl"
    mkdir "$TEMPDIR_DCTL"
    print-header 'Download dctl'
    print-spinner 'Downloading dctl' "git clone --depth 1 $repo_dctl $TEMPDIR_DCTL" ' '
    printf-color-bold '   -> ' "$fg[main]"
    print-section 'Repository' "$repo_dctl"
    printf-color-bold '   -> ' "$fg[main]"
    print-section 'Directory' " $TEMPDIR_DCTL"
    echo
  fi
}

print() { printf "$@\n"; }

print-color() {
  typeset string="$1"
  typeset reset="\e[0m"

  typeset color
  if [[ -n $3 ]]; then
   color="\e[${3};$text[fg];5;${2}m"
  else
   color="\e[$attr[default];$text[fg];5;${2}m"
  fi

  print "%b%b%b" "$color" "$string" "$reset"
}

printf-color() {
  typeset string="$1"
  typeset reset="\e[0m"

  typeset color
  if [[ -n $3 ]]; then
   color="\e[${3};$text[fg];5;${2}m"
  else
   color="\e[$attr[default];$text[fg];5;${2}m"
  fi

  printf "%b%b%b" "$color" "$string" "$reset"
}

print-color-bold() {
  print-color "$1" "$2" "$attr[bold]"
}

printf-color-bold() {
  printf-color "$1" "$2" "$attr[bold]"
}

print-header() {
  printf-color-bold ":: " "$fg[accent]"
  print "$1"
}

print-enable() {
  print-color-bold 'enable' "$fg[main]"
}

print-disable() {
  print 'disable'
}

print-mark() {
  if [[ $1 = success ]]; then
    print-color-bold "\u2714" "$fg[success]"
  elif [[ $1 = error ]]; then
    print-color-bold "\u2716" "$fg[error]"
  fi
}

print-spinner() {
  private msg="$1" cmd="$2" space="$3"
  private -a spinner
  spinner=(
    '\u280b' '\u2819' '\u2839' '\u2838' '\u283c'
    '\u2834' '\u2826' '\u2827' '\u2807' '\u280f'
  )

  ${=cmd} >/dev/null 2>&1 &
  while :; do
    for s in $spinner; do
      printf "\r%s%s %s" "$space" "`print-color-bold "$s" "$fg[main]"`" "$msg"
      sleep 0.05
      if ! jobs %% > /dev/null 2>&1; then
        if wait $!; then
          printf "\r%s%s %s\n" "$space" "`print-mark success`" "$msg"
          return 0
        else
          printf "\r%s%s %s\n" "$space" "`print-mark error`" "$msg"
          return 1
        fi
      fi
    done
  done
}

main
