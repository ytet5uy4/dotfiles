print-color() {
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

print-color-bold() { print-color "$1" "$2" "$attr[bold]"; }

print-brackets() {
  if [[ $1 = Y/n ]]; then
    print-color-bold '[' "$fg[sub]"
    print-color 'Y' "$fg[main]" "$attr[underline]"
    print-color '/' "$fg[main]"
    print-color 'n' "$fg[main]" "$attr[underline]"
    print-color-bold ']' "$fg[sub]"
  else
    print-color-bold '[' "$fg[accent]"
    printf '%s' "$1"
    print-color-bold ']' "$fg[accent]"
  fi
}

print-error() {
  print-color-bold "$1: " "$fg[error]"
  echo "$2"
  print-color-bold "Try '$1 --help' for more information.\n" "$fg[default]"
}

print-header() {
  print-color-bold ":: " "$fg[accent]"
  print "$1"
}

print-log() {
  print-brackets "`printf "%2d/%2d" "$1" "$2"`"
  print-section " $3" "$4"
}

print-mark() {
  if [[ $1 = success ]]; then
    print-color-bold '\u2713' "$fg[success]"
  elif [[ $1 = error ]]; then
    print-color-bold '\u2715' "$fg[error]"
  fi
}

print-section() {
  printf '%s' "$3"
  print-color-bold "$1" "$fg[main]"
  print-color-bold ': ' "$fg[accent]"
  printf '%s\n' "$2"
}

print-space() { [[ $1 ]] && printf "%$1s" ' '; }