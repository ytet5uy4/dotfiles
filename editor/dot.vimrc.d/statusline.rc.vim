set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l/%L,%c%V%8P
function! g:Date()
    return strftime("%x %H:%M")
endfunction
set statusline+=\ \%{g:Date()}

