nnoremap <C-h><C-h>      :<C-u>help<Space>
nnoremap <silent> <C-h><C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent> <Space>w  :<C-u>w<CR>
nnoremap <silent> <Space>q  :<C-u>q<CR>
nnoremap <Space>/ *
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
nnoremap <Space>j  <C-f>
vnoremap <Space>j  <C-f>
nnoremap <Space>k  <C-b>
vnoremap <Space>k  <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" .vimrc
nnoremap <silent> <Space><Space>.  :<C-u>edit $MYVIMRC \| :lcd ~/.vimrc.d<CR>
nnoremap <silent> <Space><Space>..  :<C-u>source $MYVIMRC<CR>

" Buffer and Tab
nnoremap <Leader>btt :tab ball<CR>

" Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>

" Tab
nnoremap [Tab] <Nop>
nmap <Leader>t [Tab]
nnoremap <silent> [Tab] :tabs<CR>
nnoremap [Tab]e :tabedit<Space>
nnoremap [Tab]t :tabnext<Space>
nnoremap <silent> [Tab]n :tabnew<CR>
nnoremap <silent> [Tab]c :tabclose<CR>
nnoremap <silent> [Tab]o :tabonly<CR>
