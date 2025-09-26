nnoremap çs <Cmd>split<bar>Startify<cr>
nnoremap çv <Cmd>vnew<bar>Startify<cr>
nnoremap <C-t> <Cmd>tabnew<bar>Startify<CR>

"" STARTIFY https://github.com/mhinz/vim-startify {{{
let g:startify_change_to_vcs_root = 1
let g:startify_update_oldfiles = 1

let g:startify_skiplist = [
      \ '.*\\vim.*\\doc\\.*',
      \ '.*\\vimfiles\\.*\\doc\\.*',
      \ ]

let g:startify_custom_header = []

if g:machine =~ 'E3000*'
  let g:startify_bookmarks = [
        \ {'g': expand("$MYVIMDIR").'gvimrc.local' },
        \ {'l': expand("$USERPROFILE").'\Documents\notas\links.txt' },
        \ {'p': expand("$USERPROFILE").'\Desktop\INFOP.txt' },
        \ {'c': expand("$MYVIMRC") }
        \ ]
else
  let g:startify_bookmarks = [
        \ {'c': expand("$MYVIMRC") }
        \ ]
endif

let g:startify_files_number = 20

let g:startify_commands = [
      \ {'x': [' terminal', 'terminal ++curwin']},
      \ {'s': [':-)', 'smile']},
      \ ]

" \ { 'type': 'dir',       'header': ['   MRU '.getcwd()]  },
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
"" }}}
