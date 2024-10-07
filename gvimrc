colorscheme realce

set background=dark

" set guicursor=a:blinkon0  " No blinking cursor in all modes
" set guicursor=n:blinkon0  " No blinking cursor, only in normal mode
set guicursor=n:block-Cursor-blinkon0,v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guioptions-=T " get rid of GUI buttons
set guioptions-=r " get rid of right scroll
set guioptions-=L " get rid of left scroll when vertical split
set guioptions+=! " External commands are executed in a terminal window
set guioptions-=t " No tearoff menu items
set guioptions-=e " Use non-GUI tab pages
set guioptions-=m " No Menu bar

set guifont=Hasklug_Nerd_Font_Mono:h9:cANSI:qDRAFT
" set guifont=Consolas:h10

if has('directx') && has('windows')
  " from README.md https://github.com/tomasiser/vim-code-dark
  " set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
  "https://github.com/vim-airline/vim-airline/wiki/FAQ#can-i-get-better-font-rendering-in-windows-gvim
  set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
endif

set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~

set browsedir=buffer

" winpos 1177 0   "right with Consolas:h10 with number and 21'' screen
winpos 1127 0   "right with Consolas:h10 with number and 13.3'' screen

" Non tracked local configuration
if filereadable(expand("$MYVIMDIR")."\\gvimrc.local")
  execute ":source " . expand("$MYVIMDIR")."\\gvimrc.local"
endif

set lines=999
set columns=87
