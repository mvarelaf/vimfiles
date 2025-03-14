if v:version > 901 || (v:version == 901 && has('patch831'))
  packadd helptoc
  nnoremap <silent><buffer> gO :HelpToc<cr>
  nnoremap <silent><buffer> <localleader>- :HelpToc<cr>
endif

" https://25.wf/posts/2020-09-04-vim-markdown-text-object.html
" or https://jdhao.github.io/2020/11/15/nvim_text_objects/
" via plugin https://github.com/coachshea/vim-textobj-markdown needs https://github.com/kana/vim-textobj-user

function! s:inCodeFence()
  " Search backwards for the opening of the code fence.
  call search('^```.*$', 'bceW')
  " Move one line down
  normal! j
  " Move to the begining of the line at start selecting
  normal! 0v
  " Search forward for the closing of the code fence.
  call search("```", 'ceW')

  normal! kg_
endfunction

function! s:aroundCodeFence()
  " Search backwards for the opening of the code fence.
  call search('^```.*$', 'bcW')
  " normal! v$
  normal! V$
  " Search forward for the closing of the code fence.
  call search('```', 'eW')
endfunction

xnoremap <buffer> <silent> if :call <sid>inCodeFence()<cr>
onoremap <buffer> <silent> if :call <sid>inCodeFence()<cr>
xnoremap <buffer> <silent> af :call <sid>aroundCodeFence()<cr>
onoremap <buffer> <silent> af :call <sid>aroundCodeFence()<cr>
