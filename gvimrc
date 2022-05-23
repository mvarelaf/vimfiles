" Adapted from https://www.vim.org/scripts/script.php?script_id=2188
" colorscheme earendel_old

" colorscheme freya
" colorscheme hybrid
" colorscheme moody
" colorscheme Tomorrow-Night
" colorscheme tolerable "light theme AirlineTheme solarized
" colorscheme simplon "light theme AirlineTheme silver
" colorscheme sourcerer "AirLineTheme badwolf or bubblegum
colorscheme manuscript
let g:airline_theme='hybrid'
" colorscheme saturnite
" let g:airline_theme='badwolf' "'base16_helios' "jet

set background=dark

" set guicursor=a:blinkon0  " No blinking cursor in all modes
" set guicursor=n:blinkon0  " No blinking cursor, only in normal mode
set guicursor=n:block-Cursor-blinkon0,v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guioptions-=T " get rid of GUI buttons
set guioptions-=r " get rid of right scroll
set guioptions-=L " get rid of left scroll when vertical split
set guioptions+=! " External commands are executed in a terminal window

set guifont=SauceCodePro_NF:h9
" set guifont=Consolas:h10

" https://github.com/tomasiser/vim-code-dark
if has('directx') && has('windows')
  " set renderoptions=type:directx
  set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
endif

set browsedir=buffer

" winpos 1177 0   "right with Consolas:h10 with number and 21'' screen
winpos 1127 0   "right with Consolas:h10 with number and 13.3'' screen
set lines=999
set columns=87
