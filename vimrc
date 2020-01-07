" vim:fdm=marker

let g:machine = hostname()

if &compatible
  set nocompatible
endif

if has('multi_byte')
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8             " better default than latin1
  setglobal fileencoding=utf-8   " change default file encoding when writing new files
endif

""" PACKAGER https://github.com/kristijanhusak/vim-packager {{{

" based on https://github.com/k-takata/minpac

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('mattn/calendar-vim')
  call packager#add('mhinz/vim-startify')
  call packager#add('mhinz/vim-sayonara')
  call packager#add('godlygeek/tabular')
  call packager#add('dhruvasagar/vim-table-mode')
  call packager#add('machakann/vim-sandwich')
  call packager#add('lifepillar/vim-mucomplete')
  call packager#add('tpope/vim-vinegar')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-fugitive')
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
  call packager#add('mivok/vimtodo')
  "call packager#add('lervag/wiki.vim')
  "call packager#add('lervag/wiki-ft.vim')
  "call packager#add('brtastic/vorg')
  call packager#add('svermeulen/vim-yoink')
  call packager#add('vimwiki/vimwiki')
  "call packager#add('')
  "call packager#local('~/my_vim_plugins/my_awesome_plugin')

  "Loaded only for specific filetypes on demand. Requires autocommands below.
  "call packager#add('SidOfc/mkdx', { 'type': 'opt' })
  call packager#add('chrisbra/csv.vim', { 'type': 'opt' })
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  "autocmd FileType markdown packadd mkdx
  autocmd FileType csv packadd csv.vim
augroup END

""" }}}

"" My SANE defaults {{{
set history=1000
set tabpagemax=30
set showcmd
set hidden

"set tabstop=2    " a tab is two spaces
"set shiftwidth=2 " an autoindent (with <<) is two spaces
set expandtab    " use spaces, not tabs

set hlsearch
set incsearch
set ignorecase
set smartcase

set copyindent
set autoindent
set smartindent

set clipboard=unnamed "copying from others with p, instead of "*p

set autoread "automatically read file if changed outside of Vim

set matchpairs=(:),{:},[:],<:> "for use with % key
set showmatch "show matching matchpair after completion

set virtualedit=block

set cmdheight=2
set laststatus=2
set ruler       " show the cursor position all the time

if has('wildmenu')
  set wildmenu
endif

set wildmode=list:longest,full

if has('wildignore')
  set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*~,*.tmp
  set wildignore+=.git,.hg,.svn
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=*.aux,*.out,*.toc        " LaTeX intermediate files
  " set wig+=.DS_Store                     " Mac
endif

set nojoinspaces " Use only 1 space after "." when joining lines, not 2

if has('insert_expand')
  "set completeopt=menuone,longest,preview
  set completeopt=menuone,noinsert,noselect
endif

set splitright
set splitbelow

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if v:version > 704 || (v:version == 704 && has('patch401'))
  set cryptmethod=blowfish2
endif

" ignore whitespace in diff mode
set diffopt+=iwhite,vertical

if has('linebreak')
  set linebreak
  set showbreak=>
  set cpoptions+=n " 'showbreak' to appear in between line numbers
  set breakindent
  set breakindentopt=shift:3,sbr
endif

" external tool when using grep
if executable('pt')
  set grepprg=pt
endif

set lazyredraw

set noerrorbells
set visualbell t_vb=
set novisualbell
if exists('&belloff')
  set belloff=all
endif

set number

" Show @@@ in the last line if it is truncated.
if v:version > 704
  set display=truncate
else
  set display=lastline
endif

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=3

set fillchars=fold:  "get rid of dashes on closed folds

if has('vcon')
  set termguicolors
endif

if !&diff
  packadd! editexisting
endif

let g:netrw_gx='<cfile>:p' "expand full path

"Lo arreglamos creando curl.cmd en PortableGit\cmd
"https://gist.github.com/gmarik/912993
"let g:netrw_http_cmd='C:\Windows\System32\curl.exe -o'

"" COPIED FROM https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim {{{
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
"" END OF COPIED FROM https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim }}}
"" }}}

"https://vimways.org/2019/vim-and-the-working-directory/
"set autochdir "automatically change dir to the current file in current window
" Open files located in the same dir in with the current file is edited
nnoremap <leader>ew :e <C-R>=expand("%:.:h") . "/"<CR>
" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>lcd :lcd %:h<CR>

"" MUCOMPLETE https://github.com/lifepillar/vim-mucomplete {{{
set shortmess+=c    " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1000 " 1 segundo

fun! MU()
  if exists("g:loaded_mucomplete")
    return get(g:mucomplete#msg#short_methods,
        \      get(g:, 'mucomplete_current_method', ''), '')
    else
      return ''
    endif
endf
""" }}}

" AIRLINE {{{
let g:airline#extensions#csv#column_display = 'Name'

if has('gui')
  let g:airline_theme='sol' "'simple' 'light' 'papercolor' 'base16'
else
  let g:airline_theme='base16'
  let g:airline_symbols_ascii = 1
endif

if has('windows')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
elseif has('linux')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
endif

let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z = '%l/%L,%v %p%%'

let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }
" }}}

set statusline=%f\ [%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
        \\ &&\ &bomb)?\",B\":\"\")}][%{&ff}]
        \\%m%r%w%y\ %k\ %=%l/%L,%v\ %p%%

" set statusline=%f\ [%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
"         \\ &&\ &bomb)?\",B\":\"\")}][%{&ff}]
"         \\%m%r%w%y%=\%{MU()}\ %k\ %=\ %{FugitiveStatusline()}\ %l/%L,%v\ %p%%

"https://vimways.org/2018/formatting-lists-with-vim/
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=n " When formatting text, recognize numbered lists
  set formatlistpat=^\\s*                     " Optional leading whitespace
  set formatlistpat+=[                        " Start character class
  set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
  set formatlistpat+=\\(                      " |  Start group
  set formatlistpat+=[0-9]\\+                 " |  |  Numbers
  set formatlistpat+=\\\|                     " |  |  or
  set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
  set formatlistpat+=\\)                      " |  End group
  set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
  set formatlistpat+=]                        " End character class
  set formatlistpat+=\\s\\+                   " One or more spaces
  set formatlistpat+=\\\|                     " or
  set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
endif

function! Preserve(command)
  let l:saved_winview = winsaveview()
  execute a:command
  call winrestview(l:saved_winview)
endfunction

" Remove trailing whitespace
nnoremap <S-F1> :call Preserve("%s/\\s\\+$//e")<CR>
" nnoremap <silent> <S-F1> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Adapted from "More Instantly Better Vim", Damian Conway
" augroup NoSimultaneousEdits
"     autocmd!
"     autocmd SwapExists * let v:swapchoice = 'o'
"     autocmd SwapExists * echohl ErrorMsg
"     autocmd SwapExists * echo 'Duplicate edit session (READONLY)'
"     autocmd SwapExists * echohl None
"     autocmd SwapExists * sleep 2
" augroup END

"if has('autocmd')
"  augroup align_windows
"    autocmd!
"    autocmd VimResized * wincmd =
"  augroup END
"endif

"" AUTOCMD {{{
if has('autocmd')
  augroup fileTypes
  autocmd!
  autocmd BufReadPost todo.txt setlocal filetype=todo tabstop=2 shiftwidth=2
  autocmd BufReadPost done.txt setlocal filetype=todo tabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2 textwidth=79
  autocmd FileType xml setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType json setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType text setlocal tabstop=2 shiftwidth=2 textwidth=79 syntax=txt
  autocmd FileType markdown compiler pandoc
  autocmd FileType markdown setlocal conceallevel=2
  " Some file types use real tabs
  autocmd FileType make setlocal noexpandtab
  autocmd FileType gitconfig setlocal noexpandtab
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
  augroup END

  augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " The following autocommand will cause the quickfix window to open after any grep invocation:
  autocmd QuickFixCmdPost *grep* cwindow
  augroup END

endif
"" }}}

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(':DiffOrig')
  command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

"" Abbreviations {{{
iab _hoy <C-R>=strftime("%d.%m.%Y")<CR>
iab _time <C-R>=strftime("%H:%M:%S")<CR>
iab _dates <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
"iab _fecha <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab _date <C-R>=strftime("%A %d %B %Y %H:%M")<CR>
"" }}}

"" :TOhtml {{{
let html_use_css = 1 "Use CSS instead of <br> and a lot of &nbsp;
"" }}}

"" Taglist.vim http://vim-taglist.sourceforge.net {{{
"Author: Yegappan Lakshmanan  (yegappan AT yahoo DOT com)
"alternative https://github.com/mtth/taglist.vim/
"let g:Tlist_Use_Right_Window=1
"let g:Tlist_WinWidth=25
let g:Tlist_Show_Menu=1
if g:machine == 'CAPRICA'
  let Tlist_Ctags_Cmd='C:\Users\Usuario\AppData\Local\utils\ctags58\ctags.exe'
endif
nnoremap <F12> :TlistToggle<CR>
"let tlist_vimwiki_settings = 'wiki;h:Headers'
"" }}}

"" CALENDAR https://github.com/mattn/calendar-vim {{{
let g:calendar_monday = 1
let g:calendar_weeknm = 2 " WK 1
let g:calendar_mark = 'left-fit'
let g:calendar_number_of_months = 6
"" }}}

"" STARTIFY https://github.com/mhinz/vim-startify {{{
let g:startify_session_dir=expand("$USERPROFILE").'\vimfiles\startify-sessions'

if g:machine =~ 'E3000*'
  let g:startify_custom_header = []
  let g:startify_bookmarks = [ expand("$USERPROFILE").'\Desktop\INFOP.txt' ]
endif

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '.getcwd()]  },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
"" }}}

"" SAYONARA https://github.com/mhinz/vim-sayonara {{{
nnoremap <leader>q :Sayonara!<cr>
"" }}}

"" MKDX https://github.com/SidOfc/mkdx {{{
"let g:mkdx#settings = { 'enter': { 'shift': 1 } }
"let g:mkdx#settings = { 'highlight': { 'enable': 1 } }
"let g:mkdx#settings = { 'map': { 'prefix': ',' } }
"" }}}

"" SANDWICH https://github.com/machakann/vim-sandwich {{{
nmap s <Nop>
xmap s <Nop>
"" }}}

"Dispatch pandoc % -o kk.html --template=GitHub.html5
"" DISPATCH https://github.com/tpope/vim-dispatch {{{
let g:dispatch_no_maps = 1
"" }}}

"" SPEEDDATING https://github.com/tpope/vim-speeddating {{{
let g:speeddating_no_mappings = 1
nmap  <C-A>     <Plug>SpeedDatingUp
nmap  <C-X>     <Plug>SpeedDatingDown
vmap  <C-A>     <Plug>SpeedDatingUp
vmap  <C-K>     <Plug>SpeedDatingDown
nmap d<C-A>     <Plug>SpeedDatingNowUTC
nmap d<C-X>     <Plug>SpeedDatingNowLocal
"" }}}

"" VIMTODO https://github.com/mivok/vimtodo {{{
let g:todo_state_colors= {
    \'DONE': 'Green',
    \'CLOSED': 'Grey',
    \'CANCELLED': 'Red',
    \'TODO': 'Blue',
    \'WAITING': 'Brown',
    \'HOLD': 'Grey',
    \'INPROGRESS': 'Cyan',
    \'SOMEDAY': 'Grey'}
""}}}

"" YOINK https://github.com/svermeulen/vim-yoink {{{
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
""}}}

"let g:wikidocs = expand("$USERPROFILE").'\Documents\wiki'
"let g:wikidocs0 = wikidocs.'\vimwiki\'
"let g:wiki_root = g:wikidocs0

"" VIMWIKI https://github.com/vimwiki/vimwiki.git {{{
if g:machine =~ 'E3000*'
  let g:wikidocs = expand("$USERPROFILE").'\Documents\wiki'
  let g:wikidocs0 = wikidocs.'\work\'
  let g:wikidocs0_templates = wikidocs.'\work\templates\'
  let g:wikidocs1 = wikidocs.'\vimwiki\'
  let g:wikidocs2 = wikidocs.'\notas\'
  let g:vimwiki_list = [{'path': wikidocs0,'index': 'work', 'nested_syntaxes': {'python': 'python', 'c++': 'cpp', 'sql': 'sql'},
          \ 'template_path': wikidocs0_templates,
          \ 'template_default': 'def_template',
          \ 'template_ext': '.html',
          \ 'auto_toc': 1},
     \ {'path': wikidocs1},
     \ {'path': wikidocs2,'index': 'mis_notas'}]
endif

"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_use_mouse = 1
"let g:vimwiki_auto_checkbox = 0
" Fold options are now global, not per g:vimwiki_list
"let g:vimwiki_folding = 'expr'
let g:vimwiki_hl_cb_checked = 1 " Highlight [X] as comments
let g:vimwiki_list_ignore_newline = 0 "Do make multiline lists
"removed in 2.0
"let g:vimwiki_camel_case = 0 "Do not make links from CamelCase words
let g:vimwiki_global_ext = 0 " No wikify by .ext outside defined directories
"let g:vimwiki_menu = '' "No menu
let g:vimwiki_browsers = ['C:\Program Files\Mozilla Firefox\firefox.exe']
"let g:vimwiki_html_header_numbering = 1 "Numbered HTML headers
"let g:vimwiki_html_header_numbering_sym = '.' "Numbers ending with .

let g:vimwiki_toc_header = 'Índice'

nmap <C-F3> :Vimwiki2HTML<CR>
imap <C-F3> <Esc><C-F3>
nmap <C-S-F3> :VimwikiAll2HTML<CR>
imap <C-S-F3> <Esc><C-S-F3>
"" }}}

runtime! mywin.vim

colorscheme desert

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
