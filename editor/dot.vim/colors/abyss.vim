"--------------------------------------------------------------------
" Description: Vim colorscheme, designed against VIM 7.4
" Credits: Inspiration from the dw_blue scheme.
" Installation: Drop this file in your $VIMRUNTIME/colors/ directory.
"--------------------------------------------------------------------

set t_Co=256 " Enable 256 colors.
set cursorline "Highlight the screen line of the cursor with CursorLine.
syntax enable " Switch on syntax highlighting
hi clear CursorLine " Reset CursorLine highlighting to the defaults.
let g:colors_name="abyss" " global variable

"--------------------------------------------------------------------
hi Boolean                                       ctermfg=27
hi cDefine                                       ctermfg=231
hi cInclude                                      ctermfg=231
hi Comment                                       ctermfg=239
hi Constant                                      ctermfg=99
hi Cursor                           ctermbg=240  ctermfg=231
hi CursorLine                       ctermbg=none
hi CursorLineNr    cterm=none       ctermbg=0    ctermfg=none
hi CursorColumn                     ctermbg=0
hi DiffAdd                          ctermbg=248  ctermfg=27
hi DiffChange                       ctermbg=248  ctermfg=27
hi DiffDelete                       ctermbg=248  ctermfg=27
hi DiffText                         ctermbg=248  ctermfg=231
hi Directory                        ctermbg=232  ctermfg=27
hi ErrorMsg                         ctermbg=231  ctermfg=232
hi FoldColumn                       ctermbg=236  ctermfg=196
hi Folded                           ctermbg=236  ctermfg=196
hi Function                         ctermbg=232  ctermfg=27
hi Identifier                       ctermbg=232  ctermfg=51
hi IncSearch       cterm=none       ctermbg=20   ctermfg=232
hi LineNr                           ctermbg=232  ctermfg=21
hi MatchParen      cterm=none       ctermbg=236  ctermfg=27
hi ModeMsg                          ctermbg=232  ctermfg=27
hi MoreMsg                          ctermbg=232  ctermfg=27
hi NonText                          ctermbg=232  ctermfg=231
hi Normal          cterm=none       ctermbg=232  ctermfg=251
hi Operator        cterm=none                    ctermfg=239
hi Pmenu                            ctermbg=233  ctermfg=255
hi PmenuSel                         ctermbg=17   ctermfg=255
hi PmenuSbar                        ctermbg=233  ctermfg=255
hi PreProc         cterm=none                    ctermfg=231
hi Question                                      ctermfg=27
hi Search          cterm=none       ctermbg=21   ctermfg=15
hi SignColumn                       ctermbg=8    ctermfg=231
hi Special         cterm=none       ctermbg=232  ctermfg=231
hi SpecialKey                       ctermbg=232  ctermfg=27
hi SpellBad                         ctermbg=26   ctermfg=232
hi Statement       cterm=bold                    ctermfg=75
hi StatusLine      cterm=bold       ctermbg=17   ctermfg=231
hi StatusLineNC    cterm=none       ctermbg=240  ctermfg=232
hi String          cterm=none                    ctermfg=39
hi TabLine         cterm=none       ctermbg=240  ctermfg=232
hi TabLineFill     cterm=underline  ctermbg=232  ctermfg=231
hi TabLineSel      cterm=none       ctermbg=19   ctermfg=232
hi Title           cterm=none                    ctermfg=27
hi Todo            cterm=none       ctermbg=232  ctermfg=196
hi Type            cterm=none                    ctermfg=231
hi VertSplit       cterm=none       ctermbg=232  ctermfg=231
hi Visual                           ctermbg=26   ctermfg=232
hi WarningMsg                       ctermbg=244  ctermfg=232
hi WildMenu                         ctermbg=231  ctermfg=17

"- end of colorscheme -----------------------------------------------
