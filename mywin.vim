" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:	Miguel Varela
" Adapted from $VIMRUNTIME/mswin.vim
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2018 Dec 07

" Bail out if this isn't wanted.
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" https://github.com/microsoft/terminal/issues/8560
if &term =~ "win32" && has('cursorshape')
  let &t_SI = "\<Esc>[5 q" "INSERT mode
  let &t_SR = "\<Esc>[3 q" "REPLACE mode
  let &t_EI = "\<Esc>[2 q" "NORMAL mode
endif
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
  " CTRL-X and SHIFT-Del are Cut
  vnoremap <C-X>   "+x
  vnoremap <S-Del> "+x

  " CTRL-C and CTRL-Insert are Copy
  vnoremap <C-C>      "+y
  vnoremap <C-Insert> "+y

  " CTRL-V and SHIFT-Insert are Paste
  map <C-V>      "+gP
  map <S-Insert> "+gP

  cmap <C-V>      <C-R>+
  cmap <S-Insert> <C-R>+
endif

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

if 1
  exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
  exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>  :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>gi

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z>  u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
" conflict with *popupmenu-completion* Accept currently selected match
" inoremap <C-Y> <C-O><C-R>
inoremap <C-Y> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>C-O>\<lt>C-R>"<CR>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all conflict with "Add [count] to the number or alphabetic character at or after the cursor.  {not in Vi}"
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG

" CTRL-E is Visually select all lines
noremap <C-E> ggVG

" " CTRL-Tab is Next window
" " do not redefine default: Go to previous (last accessed) tab page.
" noremap  <C-Tab> <C-W>w
" inoremap <C-Tab> <C-O><C-W>w
" cnoremap <C-Tab> <C-C><C-W>w
" onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap  <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" Move to window
nnoremap <C-Left>  <C-W>h
nnoremap <C-Right> <C-W>l
nnoremap <C-Up>    <C-W>k
nnoremap <C-Down>  <C-W>j

tnoremap <C-Left>  <C-W>h
tnoremap <C-Right> <C-W>l
tnoremap <C-Up>    <C-W>k
tnoremap <C-Down>  <C-W>j

" Move to window
nnoremap <A-Left>  <C-W>h
nnoremap <A-Right> <C-W>l
nnoremap <A-Up>    <C-W>k
nnoremap <A-Down>  <C-W>j

inoremap <A-Left>  <C-O><C-W>h
inoremap <A-Right> <C-O><C-W>l
inoremap <A-Up>    <C-O><C-W>k
inoremap <A-Down>  <C-O><C-W>j

tnoremap <A-Left>  <C-W>h
tnoremap <A-Right> <C-W>l
tnoremap <A-Up>    <C-W>k
tnoremap <A-Down>  <C-W>j

" Open window
nnoremap çs <C-W>s
nnoremap çv <C-W>v

tnoremap çs <C-W>s
tnoremap çv <C-W>v

" Close window
nnoremap çc <C-W>c
nnoremap çq <C-W>q

" Terminal-Normal mode
tnoremap çc <C-W>N
tnoremap çq <C-W>N

" Move window position
nnoremap çh <C-W>H
nnoremap çl <C-W>L
nnoremap çk <C-W>K
nnoremap çj <C-W>J
nnoremap çt <C-W>T
nnoremap çx <C-W>x

tnoremap çh <C-W>H
tnoremap çl <C-W>L
tnoremap çk <C-W>K
tnoremap çj <C-W>J
tnoremap çx <C-W>x

" Equal size
nnoremap çç <C-W>=
nnoremap çñ <C-W>=

tnoremap çç <C-W>=
tnoremap çñ <C-W>=

" Jump to Next window
nnoremap ç<Tab> <C-W>w
nnoremap çw     <C-W>w

tnoremap ç<Tab> <C-W>w
tnoremap çw     <C-W>w

" Jump to window <n>:
" http://stackoverflow.com/a/6404246/151007
for i in range(1, 9)
  execute 'nnoremap <silent> <Leader>'.i.' :'.i.'wincmd w<CR>'
  execute 'nnoremap <silent> <A-'.i.'> :'.i.'wincmd w<CR>'
  execute 'nnoremap <silent> ç'.i.' :'.i.'wincmd w<CR>'

  execute 'tnoremap <silent> ç'.i.' :'.i.'wincmd w<CR>'
endfor

" Jump to previous window:
nnoremap <silent> <Leader>0 :wincmd p<CR>
nnoremap <silent> <A-0> :wincmd p<CR>
nnoremap <silent> ç0 :wincmd p<CR>
nnoremap <silent> çp :wincmd p<CR>

tnoremap ç0 <C-W>p
tnoremap çp <C-W>p

" CTRL-F is the search dialog also in console mode
noremap  <expr> <C-F> "/\\v<C-Left>"
inoremap <expr> <C-F> "\<C-\>\<C-O>/\\v<C-Left>"

" CTRL-H is the replace dialog
nnoremap <C-H> :%s/<C-R>=expand("<cword>")<CR>//gc<Left><Left><Left>

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif
