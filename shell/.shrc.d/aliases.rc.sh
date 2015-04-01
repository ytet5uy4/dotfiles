# ls
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'

# cd
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# Vim
alias vi='vim'
alias tweetvim='vim +TweetVimHomeTimeline'
alias tweet='vim +TweetVimCommandSay'
alias agit='vim +Agit'
alias ninst='vim +NeoBundleInstall +qall'
alias nreinst='vim +NeoBundleReinstall +qall'
alias nup='vim +NeoBundleUpdate +qall'
alias ncl='vim +NeoBundleClean +qall'

# Others
alias grep='grep --color'
alias df='df -h'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias gitsbi='git submodule foreach "echo -e \$name\\\n\$path\\\n\$sha1\\\n"'
alias dsetup='dotsetup'
alias dset='dotsetup'

# Cygwin
if [ $OSTYPE = cygwin ]; then
    source ~/.shrc.d/aliases.cygwin.rc.sh
fi

# Darwin
if [ $OSTYPE = darwin ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -F'
else
    eval "$(dircolors ~/.shrc.d/dir_colors.rc.sh)"
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Local
if [ -e ~/.local.d/shrc.d/aliases.rc.sh ]; then
    source ~/.local.d/shrc.d/aliases.rc.sh
fi