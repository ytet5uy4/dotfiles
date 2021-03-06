if status --is-interactive
  set --global fish_user_abbreviations
  abbr --add -- - 'cd -'
  abbr --add c cp
  abbr --add d docker
  abbr --add dc docker-compose
  abbr --add e exa
  abbr --add f fd
  abbr --add g git
  abbr --add k kubectl
  abbr --add kn kubens
  abbr --add kx kubectx
  abbr --add m mv
  abbr --add md mkdir
  abbr --add n nvim
  abbr --add p 'xsel >'
  abbr --add r rg
  abbr --add s sudo
  abbr --add se sudoedit
  abbr --add st stern
  abbr --add t terraform
  abbr --add ta trash
  abbr --add note "$EDITOR ~/Documents/note.md"
  abbr --add task "$EDITOR ~/Documents/task.md"
  abbr --add b bat
  abbr --add \
    bs "set f (mktemp XXXXXXXXXX.bash); $EDITOR \$f && bat --paging=never \$f; bash \$f; rm -f \$f"
end
