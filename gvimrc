" Adapted from https://www.vim.org/scripts/script.php?script_id=2188
colorscheme earendel_old

if g:machine == 'CAPRICA'
  set background=dark
else
  set background=light
endif

" set guicursor=a:blinkon0  " No blinking cursor in all modes
" set guicursor=n:blinkon0  " No blinking cursor, only in normal mode
set guicursor=n:block-Cursor-blinkon0,v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guioptions-=T         " get rid of GUI buttons
set guioptions-=r         " get rid of right scroll
set guioptions-=L         " get rid of left scroll when vertical split

set guifont=Consolas:h10

" winpos 1177 0   "right with Consolas:h10 with number and 21'' screen
winpos 1127 0   "right with Consolas:h10 with number and 13.3'' screen
set lines=999
set columns=87
