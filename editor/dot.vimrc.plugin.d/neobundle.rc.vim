if !1 | finish | endif

" NeoBundle
if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  let g:neobundle#log_filename = $HOME.'/.vim/var/tmp/plugin/neobundle.log'

  call neobundle#begin(expand('~/.vim/bundle/'))

  source ~/.vimrc.plugin.d/neobundle.list.rc.vim

  call neobundle#end()

  call unite#custom#profile('default', 'context', {
    \ 'prompt_direction': 'top',
    \ 'prompt': '> ',
    \ 'candidate_icon': '- ',
    \ 'hide_icon': 0 })

  filetype plugin indent on

  NeoBundleCheck
endif
