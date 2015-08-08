export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PAGER="less"
export LESS="-ciMNR"
export WWW_BROWSER="w3m"
if [ -d ~/bin ]; then
  export PATH="$PATH:$HOME/bin"
fi
export PATH="$PATH:$HOME/.dotfiles/bin"

# Cygwin
if [ "$OSTYPE" = "cygwin" ]; then
  export CYGWIN="winsymlinks"
fi

# OSX
if [ `uname` = Darwin ]; then
  export LSCOLORS="gxfxcxdxbxegedabagacad"
fi

# Node.js
## Nodebrew
if [ -d ~/.nodebrew ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# Ruby
if which ruby >/dev/null 2>&1; then
  export KCODE="u"
fi
## rbenv
if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "`rbenv init -`"
fi

# Editor
if which vim >/dev/null 2>&1; then
  export EDITOR="vim"
  export FCEDIT="vim"
  export SVN_EDITOR="vim"
else
  export EDITOR="vi"
  export FCEDIT="vi"
  export SVN_EDITOR="vi"
fi

# man
man() {
  env \
    LESS_TERMCAP_mb=`printf "\e[1;31m"` \
    LESS_TERMCAP_md=`printf "\e[1;31m"` \
    LESS_TERMCAP_me=`printf "\e[0m"` \
    LESS_TERMCAP_se=`printf "\e[0m"` \
    LESS_TERMCAP_so=`printf "\e[1;44;33m"` \
    LESS_TERMCAP_ue=`printf "\e[0m"` \
    LESS_TERMCAP_us=`printf "\e[1;32m"` \
    man "$@"
}
