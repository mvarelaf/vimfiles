"" STARTIFY https://github.com/mhinz/vim-startify {{{
let g:startify_change_to_vcs_root = 1
let g:startify_update_oldfiles = 1

let g:startify_skiplist = [
      \ '.*\\vim82\\doc\\.*',
      \ '.*\\vimfiles\\.*\\doc\\.*',
      \ ]

let g:startify_session_dir=expand("$USERPROFILE").'\vimfiles\startify-sessions'

if g:machine =~ 'E3000*'
  let g:startify_custom_header = []
  let g:startify_bookmarks = [
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

" \ { 'type': 'dir',       'header': ['   MRU '.getcwd()]  },
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
"" }}}
