if [ -d ~/.zsh/bundle/repos ]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 500
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-pushd true
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':completion:*:*:cdr:*:*' menu selection

  # Reload zaw.zsh for antigen bug?
  source ~/.zsh/bundle/repos/*/zaw.zsh

  zstyle ':filter-select' case-insensitive yes

  bindkey '^X^A' zaw-applications
  bindkey '^@' zaw-cdr
  bindkey '^R' zaw-history
  bindkey '^X^F' zaw-git-files
  bindkey '^X^B' zaw-git-branches
  bindkey '^X^P' zaw-process
  bindkey '^S' zaw-ssh-hosts
  bindkey '^T' zaw-tmux

  zstyle ':filter-select:highlight' selected bg=blue
  zstyle ':filter-select:highlight' matched fg=cyan
  zstyle ':filter-select' max-lines -10
  zstyle ':filter-select' rotate-list yes
  zstyle ':filter-select' case-insensitive yes
  zstyle ':filter-select' extended-search yes
fi
