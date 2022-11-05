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

let mapleader = ","
let maplocalleader = ","

" Do not load some standard plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let loaded_gzip = 1
let g:loaded_zipPlugin = 1
let g:loaded_tarPlugin = 1
" let g:loaded_spellfile_plugin = 1
" let g:loaded_2html_plugin = 1
" let g:loaded_netrwPlugin = 1

call plug#begin()
Plug 'mattn/calendar-vim'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara'
Plug 'ackyshake/VimCompletesMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mivok/vimtodo'
Plug 'vimwiki/vimwiki'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'yegappan/bufselect'
Plug 'yegappan/fileselect'
Plug 'preservim/tagbar', { 'for': 'markdown' }
Plug 'AndrewRadev/quickpeek.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'

Plug 'chrisbra/csv.vim', { 'on': [] }
" call plug#load('csv.vim')
Plug 'mvarelaf/vim-markdown-folding', { 'for': 'markdown' }
" Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
" Plug 'bhurlow/vim-parinfer', { 'for': ['racket', 'scheme', 'lisp'] }
" Plug 'jpalardy/vim-slime', { 'for': ['racket', 'scheme', 'lisp'] }
" Plug 'jalvesaq/Nvim-R', { 'for': 'r', 'branch': 'stable' }
call plug#end()

"" My SANE defaults {{{

"" ADAPTED FROM https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim {{{
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif
"" END OF ADAPTED FROM https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim }}}

set cmdheight=2

set showcmd
set hidden

set expandtab    " use spaces, not tabs

set hlsearch
set ignorecase
set smartcase

set infercase

set copyindent
set smartindent

set clipboard=unnamed

set matchpairs=(:),{:},[:],<:> "for use with % key
set showmatch "show matching matchpair after completion

set virtualedit=block

set shortmess+=I    " don't give the intro message when starting Vim
set shortmess+=r    " use "[RO]" instead of "[readonly]"
set shortmess+=m    " use "[+]" instead of "[Modified]"
set shortmess-=S    " show search count message when searching, e.g. [1/5]"
set shortmess+=n    " n use "[New]" instead of "[New File]"
set shortmess+=w    " w use "[w]" instead of "written" for file write message
                    " and "[a]" instead of "appended" for ':w >> file' command
set shortmess+=x    " x use "[dos]" instead of "[dos format]", "[unix]" instead of
                    "[unix format]" and "[mac]" instead of "[mac format]".

set suffixes+=.pyc,.pyo,.egg-info,.class

" set wildmode=longest,full
set wildmode=longest:list,full

if has('wildignore')
  set wildignorecase
  set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*~,*.tmp
  set wildignore+=.git,.hg,.svn
  " set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=*.aux,*.out,*.toc        " LaTeX intermediate files
  set wildignore+=.DS_Store                " Mac
  set wildignore+=*.a,*.pdb,*.lib "stuff to ignore when tab completing
  set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
  set wildignore+=*.so,*.dll,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
  " set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
  set wildignore+=*.ipch,*.gem
  set wildignore+=*.tga,*.pcx,*.ppm,*.img,*.iso
  set wildignore+=*/.Trash/**,*.dmg,*/.rbenv/**
  " set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
  set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
  set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
  set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
  " set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
  set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.msu
  set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
  set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
  set wildignore+=tags

endif

set nojoinspaces " Use only 1 space after "." when joining lines, not 2

if has('insert_expand')
  " set completeopt=menuone,noinsert,noselect
  " set completeopt=menuone,noinsert,preview "menu,preview "is the default
  set completeopt=menuone,preview "menu,preview "is the default
endif

if has('mksession')
  set sessionoptions-=blank
endif

set splitright
set splitbelow

" set noequalalways
set equalalways eadirection=hor

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if v:version > 704 || (v:version == 704 && has('patch401'))
  set cryptmethod=blowfish2
endif

" ignore whitespace in diff mode
set diffopt+=iwhite,vertical
if has("patch-8.1.0360") "from chrisbra/vim-diff-enhanced
  set diffopt+=algorithm:patience "myers is default algorithm
  set diffopt+=indent-heuristic
endif

if has('linebreak')
  set linebreak
  set showbreak=>
  set cpoptions+=n " 'showbreak' to appear in between line numbers
  set breakindent
  set breakindentopt=shift:3,sbr
endif

set lazyredraw

set noerrorbells
set visualbell t_vb=
set novisualbell
if exists('&belloff')
  set belloff=all
endif

set number
set relativenumber

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Show @@@ in the last line if it is truncated.
if v:version > 704
  set display=truncate
else
  set display=lastline
endif

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=3

" No statusline, fold, vertical or diff fillchars
set fillchars=

set nostartofline

if has('vcon')
  set termguicolors
endif

if !&diff
  packadd! editexisting
endif

let g:netrw_gx='<cfile>:p' "expand full path
let g:netrw_liststyle = 3 " show subfolders as ascii tree

"" }}}

inoremap <C-Space> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>Space>"<CR>

"" Abbreviations {{{
iab _hoy <C-R>=strftime("%d.%m.%Y")<CR><C-R>=Eatchar('\s')<CR>
iab _time <C-R>=strftime("%H:%M:%S")<CR><C-R>=Eatchar('\s')<CR>
iab _dates <C-R>=strftime("%d/%m/%Y %H:%M")<CR><C-R>=Eatchar('\s')<CR>
"iab _fecha <C-R>=strftime("%a %b %d %T %Z %Y")<CR><C-R>=Eatchar('\s')<CR>
iab _date <C-R>=strftime("%A %d %B %Y %H:%M")<CR><C-R>=Eatchar('\s')<CR>
iab _iso_date <C-R>=strftime("%FT%T%z")<CR><C-R>=Eatchar('\s')<CR>
iab _rfc_date <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><C-R>=Eatchar('\s')<CR>

" Too many mistakes
cabbrev W   w
cabbrev Q   q
cabbrev Qa  qa
cabbrev QA  qa
cabbrev Wq  wq
cabbrev WQ  wq
cabbrev Wqa wqa
cabbrev WQa wqa
cabbrev WQA wqa

"" }}}

"" :TOhtml {{{
let html_use_css = 1 "Use CSS instead of <br> and a lot of &nbsp;
"" }}}

"" CALENDAR https://github.com/mattn/calendar-vim {{{
let g:calendar_monday = 1
let g:calendar_weeknm = 2 " WK 1
let g:calendar_mark = 'left-fit'
let g:calendar_number_of_months = 6
if has('autocmd')
  augroup calendar
  autocmd!
  autocmd Filetype calendar setlocal nonumber norelativenumber
  augroup END
endif
"" }}}

"" SAYONARA https://github.com/mhinz/vim-sayonara {{{
nnoremap <silent> <leader>q :Sayonara!<cr>
nnoremap <silent> <leader>c :Sayonara<cr>
"" }}}

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
          " \ 'template_default': 'article_template',

let g:vimwiki_use_mouse = 1
"let g:vimwiki_auto_checkbox = 0
" Fold options are now global, not per g:vimwiki_list
let g:vimwiki_folding = 'expr' " folds sections and code blocks
let g:vimwiki_hl_cb_checked = 1 " Highlight [X] as comments
let g:vimwiki_list_ignore_newline = 0 "Do make multiline lists
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

" Poor man bufexplorer
nnoremap <leader>ls :ls<CR>:b<space>

"" BUFSELECT https://github.com/yegappan/bufselect {{{
nmap <F2> <Plug>Bufselect_Toggle
nnoremap <leader>b :Bufselect<CR>
"" }}}

"" FILESELECT https://github.com/yegappan/fileselect {{{
nmap <F4> <Plug>(FileselectToggle)
nnoremap <leader>f :Fileselect<CR>
"" }}}

if has('autocmd')
  if has('gui') && !&diff
    augroup cursor_line
      autocmd!
      au VimEnter * set cursorline
      au WinLeave,InsertEnter * set nocursorline
      au WinEnter,InsertLeave * set cursorline
    augroup END
  endif
endif

" Markdown
let g:markdown_fenced_languages = ['sql']

"" VIM-MARKDOWN-FOLDING https://github.com/mvarelaf/vim-markdown-folding {{{
" from upstream https://github.com/masukomi/vim-markdown-folding
let g:markdown_fold_indent_title = 1
"" }}}

colorscheme desert

set noshowmode
" AIRLINE https://github.com/vim-airline/vim-airline {{{
if has('gui')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='hybrid'
else
  let g:airline_theme='deus'
  let g:airline_symbols_ascii = 1
endif

if has('windows')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
elseif has('linux')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
endif

let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#vcs_checks = ['untracked']

let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z = '%l/%L,%02v %p%%'

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
    \ 'v'      : 'v',
    \ 'V'      : 'V',
    \ ''     : '|V|',
    \ }
" }}}

"https://vimways.org/2018/formatting-lists-with-vim/
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=n " When formatting text, recognize numbered lists
  set formatlistpat=^\\s*                     " Optional leading whitespace
  set formatlistpat+=[                        " Start character class
  set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
  set formatlistpat+=\\(                      " |  Start group
  set formatlistpat+=[0-9]\\+                 " |  |  Numbers
  "set formatlistpat+=\\\|                     " |  |  or
  "set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
  set formatlistpat+=\\)                      " |  End group
  set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
  set formatlistpat+=]                        " End character class
  set formatlistpat+=\\s\\+                   " One or more spaces
  set formatlistpat+=\\\|                     " or
  set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
endif

" Add full path and buffer number to Ctrl-G display
nnoremap <C-g> 2<C-g>
" ga shows info of character under sursor

" Highlight all occurrences of current word without moving
" nnoremap <leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Open files located in the same dir in with the current file is edited
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>lcd :lcd %:h<CR>

" https://github.com/jwhitley/vim-preserve
function! Preserve(command)
  let l:saved_winview = winsaveview()
  let l:last_search = getreg('/')
  execute 'keepjumps ' . a:command
  call winrestview(l:saved_winview)
  call setreg('/', l:last_search)
endfunction

" Remove trailing whitespace
nnoremap <silent> <S-F1> :call Preserve("%s/\\s\\+$//e")<CR>

vnoremap <silent> <S-F1> :retab<CR>

" Visual select last paste
nnoremap <expr> vp '`[' . getregtype()[0] . '`]'

" https://vim.fandom.com/wiki/Smart_home
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
"" noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
" noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? 'g_' : '$')
" vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
" imap <End> <C-o><End>

"Inspired by https://vim.fandom.com/wiki/Find_in_files_within_Vim
nmap <F3> :Search<Space>
nmap <S-F3> :ESearch<Space>

func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

cabbrev Search
      \ vimgrep //j
      \ *<C-Left><C-Left><Right><C-R>=Eatchar('\s')<CR>

" cabbrev Search
"       \ vimgrep //j
"       \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
"       \ <C-Left><C-Left><Right><C-R>=Eatchar('\s')<CR>

cabbrev ESearch
      \ vimgrep /\<lt><C-R>=expand("<cword>")<CR>\>/j
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <C-Left><C-Left><Right><Right><Right><C-R>=Eatchar('\s')<CR>

"" AUTOCMD {{{
if has('autocmd')
  augroup fileTypes
  autocmd!
  autocmd Filetype outlaw setlocal tabstop=2 shiftwidth=2
  autocmd Filetype todo setlocal tabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2 textwidth=79
  autocmd FileType xml setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType json setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType text setlocal tabstop=2 shiftwidth=2 textwidth=79 syntax=txt
  autocmd FileType markdown compiler pandoc
  autocmd FileType markdown setlocal conceallevel=2
  if has('file_in_path')
    autocmd FileType markdown setlocal suffixesadd=.md,.markdown
  endif
  autocmd FileType racket setlocal tabstop=2 shiftwidth=2 commentstring=;;%s
  " Some file types use real tabs
  autocmd FileType make setlocal noexpandtab
  autocmd FileType gitconfig setlocal noexpandtab
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
  autocmd FileType c setlocal noexpandtab cinoptions=:0,l1,t0,g0,(0
  autocmd FileType sql let g:omni_sql_no_default_maps = 1
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
  autocmd QuickFixCmdPost [^l]*grep* cwindow
  autocmd QuickFixCmdPost l*grep* lwindow
  augroup END

  augroup niceties
    autocmd!
    autocmd VimResized * wincmd =
  augroup END
endif
"" }}}

runtime! mywin.vim
runtime! statusline.vim

if !has('gui')
  let g:webdevicons_enable = 0
endif

if g:machine =~ 'E3000*'
  set pythonthreedll=$USERPROFILE\AppData\Local\Continuum\miniconda3\python37.dll
  set pythonthreehome=$USERPROFILE\AppData\Local\Continuum\miniconda3\
elseif g:machine == 'CAPRICA'
  let g:FactorRoot = 'D:\factor'
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(':DiffOrig')
  command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

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

" after/plugin/startify.vim
nnoremap <silent> <leader>s :split<bar>Startify<cr>
nnoremap <silent> <leader>v :vsplit<bar>Startify<cr>
nnoremap <silent> <leader>t :tabnew<bar>Startify<cr>

"" TAGBAR https://github.com/preservim/tagbar {{{
" https://github.com/majutsushi/tagbar
nmap <F12> :TagbarToggle<CR>
"" }}}

"" QUICKPEEK https://github.com/AndrewRadev/quickpeek.vim {{{
" let g:quickpeek_auto = v:true
let g:quickpeek_window_settings = []
"" }}}

"" VIM-EASY-ALIGN https://github.com/junegunn/vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

xmap <Leader>ga <Plug>(LiveEasyAlign)
"" }}}

