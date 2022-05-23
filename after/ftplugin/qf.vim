nnoremap <buffer> <leader>v :QuickpeekToggle<cr>
nnoremap <buffer> <leader>c :cclose<cr>
nnoremap <buffer> <leader>q :cclose<cr>
nnoremap <buffer> <F3> :cclose<cr>

if get(w:, 'quickfix_title') =~# 'Help TOC'
  set conceallevel=2
  set concealcursor=nc
  nnoremap <buffer> <leader>c :lclose<cr>
  nnoremap <buffer> <leader>q :lclose<cr>
  nnoremap <buffer> <F3> :lclose<cr>
endif
