nnoremap H <C-i>
nnoremap L <C-o>
nnoremap j gj
nnoremap k gk
nnoremap <C-g> 1<C-g>
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
nnoremap <Space>/ *
vnoremap v $h
noremap <Space>v 0v$h
noremap <Space>pw :<C-u>pwd<CR>
nnoremap <C-h>h :<C-u>help<Space>
nnoremap <Space>e :<C-u>edit!<CR>
noremap <silent><Space>cd :<C-u>lcd<Space>%:h<CR>
nnoremap <Space>md :<C-u>!clear<Space>&&<Space>mkdir<Space>
nnoremap <Space>enc :<C-u>e ++encoding=''<Left>
nnoremap <Space>ff  :<C-u>e ++fileformat=''<Left>
nnoremap <Space>w! :w !sudo tee >/dev/null %<CR> :e!<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent><Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

" emacs like
cnoremap <C-a> <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" clipboard
nnoremap Y y$
noremap <Space>yf :let @+=expand( '%:t') \| echo "Filename copied"<CR>
noremap <Space>yp :let @+=expand('%:p') \| echo "Pathname copied"<CR>
if has( "clipboard" )
  xmap <Space>y "+y
  xmap <Space>Y "+Y
  xmap <Space>d "+d
  xmap <Space>D "+D
  xmap <Space>p "+p
  xmap <Space>P "+P
  nmap <Space>y "+y
  nmap <Space>Y "+Y
  nmap <Space>d "+d
  nmap <Space>D "+D
  nmap <Space>p "+p
  nmap <Space>P "+P
endif

" Substitute
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

" .vimrc
nnoremap <silent> <Space>.  :<C-u>edit ~/.vim/rc<CR>
nnoremap <silent> <Space>>  :<C-u>tabedit ~/.vim/rc<CR>
nnoremap <silent> <Space>..  :<C-u>source $MYVIMRC<CR>

" Search
" Current line at center of window and open the folding.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" TextObject
onoremap aa a>
onoremap ia i>
onoremap ar a]
onoremap ir i]
onoremap ad a"
onoremap id i"

" Tab
nnoremap [Tab] <Nop>
nmap <Space>t [Tab]
nnoremap [Tab] :tabedit<Space>
nnoremap [Tab]b :tabnew<Space>\|<Space>b<Space>
nnoremap K :tabnext<CR>
nnoremap J :tabprevious<CR>
nnoremap <silent> [Tab]o :tabonly<CR>
nnoremap <silent> [Tab]m :tabmove<CR>
nnoremap <silent> [Tab]0m :0tabmove<CR>
nnoremap <silent> [Tab]> :tabmove<Space>+1<CR>
nnoremap <silent> [Tab]< :tabmove<Space>-1<CR>

" C-Space
if has('unix') && !has('gui_running')
  map <NUL> <C-Space>
  map! <NUL> <C-Space>
endif
