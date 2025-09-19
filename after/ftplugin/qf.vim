setlocal nowinfixheight

nnoremap <buffer> <localleader>v :QuickpeekToggle<cr>
nnoremap <buffer> P :QuickpeekToggle<cr>
nnoremap <silent> <buffer> gq :cclose<CR>
nnoremap <buffer> <F3> :cclose<cr>

if get(w:, 'quickfix_title') =~# 'Help TOC'
  setlocal nonumber
  setlocal conceallevel=2
  setlocal concealcursor=nc

  nnoremap <silent> <buffer> gq :lclose<CR>
  nnoremap <buffer> <F3> :lclose<cr>
endif
