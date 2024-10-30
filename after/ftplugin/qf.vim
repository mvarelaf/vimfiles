setlocal nowinfixheight

nnoremap <buffer> <localleader>v :QuickpeekToggle<cr>
nnoremap <buffer> P :QuickpeekToggle<cr>
nnoremap <buffer> <localleader>c :cclose<cr>
nnoremap <buffer> <localleader>q :cclose<cr>
nnoremap <buffer> <F3> :cclose<cr>

if get(w:, 'quickfix_title') =~# 'Help TOC'
  setlocal nonumber
  setlocal conceallevel=2
  setlocal concealcursor=nc

  nnoremap <buffer> <localleader>c :lclose<cr>
  nnoremap <buffer> <localleader>q :lclose<cr>
  nnoremap <buffer> <F3> :lclose<cr>
endif
