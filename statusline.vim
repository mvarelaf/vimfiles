" StatusLine
function! StatusHighlights() abort
  highlight StlModeNORMAL  guibg=lightgreen guifg=black ctermbg=black ctermfg=white
  highlight link StlModeN  StlModeNORMAL
  highlight StlModeI       guibg=darkblue guifg=white ctermbg=darkblue  ctermfg=white
  highlight StlModeVISUAL  guibg=darkred guifg=white ctermbg=darkred ctermfg=white
  highlight link StlModeVL  StlModeVISUAL
  highlight link StlModeVB  StlModeVISUAL
  highlight link StlModeV  StlModeVISUAL
  highlight StlModeR       guibg=darkblue guifg=white ctermbg=darkblue ctermfg=white
  highlight StlSection     guibg=#3e4452 guifg=#abb2bf ctermbg=237 ctermfg=145
  highlight StlWarning     guibg=#e5c07b guifg=#484848 ctermbg=180 ctermfg=239
  highlight StlError       guibg=#e06c75 guifg=#282828 ctermbg=204 ctermfg=235
  highlight link StlModeC     StlModeNORMAL
  highlight link StlModeP     StlModeNORMAL
  highlight link StlModeSHELL StlModeNORMAL
  highlight StlModeTERMINAL   guibg=black guifg=yellow ctermbg=black ctermfg=yellow
  " highlight link StlModeTERMINAL StlModeNORMAL
  highlight link StlModeS   StlModeVISUAL
  highlight link StlMode    StlModeNORMAL
endfunction

if has('autocmd')
  augroup MyColors
      autocmd!
      autocmd ColorScheme * call StatusHighlights()
  augroup END

  augroup StatusLineAug
    autocmd!
    autocmd VimEnter,WinEnter * call Statusline_update('active')
    autocmd BufDelete,BufNew,BufNewFile * call Statusline_update('active')
    autocmd FileType,CursorHold * call Statusline_update('active')
    autocmd WinLeave * call Statusline_update('deactive')
  augroup END
endif

let g:currentmode={
    \ 'n'  : 'N',
    \ 'no' : 'N',
    \ 'v'  : 'v',
    \ 'V'  : 'V',
    \ '' : '|V|',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 'c'  : 'C',
    \ 'cv' : 'C',
    \ 'ce' : 'C',
    \ 'r'  : 'P',
    \ 'rm' : 'P',
    \ 'r?' : 'P',
    \ '!'  : 'SHELL',
    \ 't'  : 'TERMINAL'
    \}

" vim mode
function! Statusline_mode(...) abort
  let l:mode = get(a:, '1', g:currentmode[mode()])
  execute 'highlight! link StlMode StlMode' . l:mode
  return l:mode
endfunction

" set current buffer statusline
function! Statusline_update(...) abort
  if &filetype ==# '' && &buftype ==# 'nofile'
    return
  endif
  let l:type = get(a:, '1', 'active')
  let l:status = ''
  " get statusline of filetype from g:statusline
  if exists('g:statusline["' . &filetype . '"]')
    let l:status = get(g:statusline[&filetype], l:type, v:false)
  else
    let l:status = get(g:statusline['_'], l:type, v:false)
  endif
  if l:status !=# v:false
    execute 'setlocal statusline=' . l:status
  endif
endfunction

function! Statusline_time() abort
  return strftime("%A %d %B %T")
endfunction

if !exists('g:statusline')
  let g:statusline = {}
  let g:statusline["startify"] = {
    \   'active': '\ %{hostname()}\ %{Statusline_time()}%=\ %Y\ ',
    \   'deactive': '%q'
    \ }
endif

if !exists('g:statusline["_"]')
  let g:statusline['_'] = {
    \   'active': join([
    \         '%#StlMode#\ %{Statusline_mode()}\ %*',
    \         '%#StlSection#\%{FugitiveHead(8)}\',
    \         '%0*\ %<%F%m%r%w\ ',
    \         '%=',
    \         '%#StlSection#\%Y',
    \         '\ %{(&fenc!=\"\"?&fenc:&enc)',
    \         '.((exists(\"+bomb\")&&\ &bomb)?\",B\":\"\")}',
    \         '\(%{&ff})',
    \         '%#StlMode#\ %l/%L,%02v\ %p%%',
    \      ], ''),
    \   'deactive': '%F%#StlError#\%{and(&modifiable,&modified)?\"[+]\":\"\"}%*'
    \ }
endif

" set statusline=%f\ [%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
        " \\ &&\ &bomb)?\",B\":\"\")}][%{&ff}]
        " \\%m%r%w%y\ %k\ %=%l/%L,%v\ %p%%

" set statusline=%f\ [%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
"         \\ &&\ &bomb)?\",B\":\"\")}][%{&ff}]
"         \\%m%r%w%y%=\%{MU()}\ %k\ %=\ %{FugitiveStatusline()}\ %l/%L,%v\ %p%%
