# autoload and widget
. $ZDOTDIR/autoload/init.zsh

# option
setopt no_beep
setopt print_eight_bit
setopt interactive_comments
setopt notify
setopt noclobber

## history
setopt hist_expand
setopt share_history
setopt hist_no_store
setopt extended_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history

# keybind
stty stop undef
bindkey -v

## emacs like
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^U' backward-kill-line
bindkey -v '^K' kill-line
bindkey -v '^D' delete-char-or-list
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^F' forward-char
bindkey -v '^B' backward-char

## history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

## Selector
bindkey '^@'   selector-select-widget
bindkey '^@c'  selector-change-dir-widget
bindkey '^\'   selector-change-recent-dir-widget
bindkey '^@g'  selector-change-repository-widget
bindkey '^@f'  selector-edit-files-widget
bindkey '^@.'  selector-edit-dotfiles-widget
bindkey '^r'   selector-exec-history-widget
bindkey '^@s'  selector-exec-ssh-widget
bindkey '^@ga' selector-git-add-widget
bindkey '^@gb' selector-git-checkout-widget
bindkey '^@p'  selector-copy-password-widget
bindkey '^@n'  selector-switch-network-widget

## others
bindkey -v '^[[Z' reverse-menu-complete
bindkey -v '^[e' editor-widget
bindkey -v '^[g' git-widget
bindkey -v '^[f' fuck-widget
bindkey -v '^_' reload-widget
bindkey -v '^Z' ctrl-z-widget
bindkey -v ' ' abbrev-expand-widget
bindkey -v '^x ' no-abbrev-expand-widget

# cdr
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
zstyle ':chpwd:*' recent-dirs-file "$XDG_CACHE_HOME/zsh/chpwd-recent-dirs"

# notify
add-zsh-hook preexec remember-cmd
add-zsh-hook precmd behind-window-notify
