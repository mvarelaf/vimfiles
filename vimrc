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
Plug 'ackyshake/VimCompletesMe', { 'frozen' : 1 }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'mivok/vimtodo'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar', { 'for': 'markdown' }
Plug 'AndrewRadev/quickpeek.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'habamax/vim-select'
Plug 'habamax/vim-select-more'

Plug 'chrisbra/csv.vim', { 'on': [] }
" call plug#load('csv.vim')
Plug 'mvarelaf/vim-markdown-folding', { 'for': 'markdown', 'frozen': 1 }
" Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
" Plug 'bhurlow/vim-parinfer', { 'for': ['racket', 'scheme', 'lisp'] }
" Plug 'jpalardy/vim-slime', { 'for': ['racket', 'scheme', 'lisp'] }
" Plug 'jalvesaq/Nvim-R', { 'for': 'r', 'branch': 'stable' }
call plug#end()

"" My SANE defaults {{{

set cmdheight=2

set showcmd
set hidden

set hlsearch
set ignorecase
set smartcase

set infercase

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

if v:version >= 900
  set wildoptions=fuzzy,pum
else
  set wildmode=longest:list,full
endif

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
let g:netrw_browse_split = 3 " open file in vertical split

if has('syntax')
  set spelllang=es,en
  set spelloptions=camel
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat^=%f:%l:%c:%m
endif

" if executable('ugrep')
"   set grepprg=ugrep\ -RInk\ -j\ -u\ --tabs=1\ --ignore-files
"   set grepformat=%f:%l:%c:%m,%f+%l+%c+%m,%-G%f\\\|%l\\\|%c\\\|%m
" endif
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

" Poor man bufexplorer
nnoremap <leader>ls :ls<CR>:b<space>

if has('autocmd')
  if !&diff
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

try
  colorscheme habamax "Included into vim 9.0.133
catch /^Vim\%((\a\+)\)\=:E185:/
  colorscheme desert
endtry

set noshowmode
" AIRLINE https://github.com/vim-airline/vim-airline {{{
let g:airline_theme='distinguido'

let g:airline_powerline_fonts = 1

if has('windows')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
elseif has('linux')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
endif

if has('autocmd')
  augroup my_airline
    autocmd!
    autocmd User AirlineToggledOn set shortmess+=S
    autocmd User AirlineToggledOff set shortmess-=S " show search count message, e.g. [1/5]"
  augroup END
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

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tabs_label = ''

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

" Adapted from https://vimways.org/2018/formatting-lists-with-vim/
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=n " When formatting text, recognize numbered lists
  set formatlistpat=^\\s*                     " Optional leading whitespace
  set formatlistpat+=[                        " Start character class
  set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
  set formatlistpat+=\\(                      " |  Start group
  set formatlistpat+=[0-9]\\+                 " |  |  Numbers
  set formatlistpat+=\\)                      " |  End group
  set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
  set formatlistpat+=]                        " End character class
  set formatlistpat+=\\s\\+                   " One or more spaces
  set formatlistpat+=\\\|                     " or
  set formatlistpat+=^\\s*[-–+*•]\\s\\+      " Bullet points
endif

" Add full path and buffer number to Ctrl-G display
nnoremap <C-g> 2<C-g>
" ga shows info of character under sursor
" or use :as[cii] because ga is used for EasyAlign

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
     autocmd FileType text setlocal textwidth=79 syntax=txt
     autocmd FileType markdown compiler pandoc
     if has('file_in_path')
       autocmd FileType markdown setlocal suffixesadd=.md,.markdown
     endif
     autocmd FileType racket setlocal commentstring=;;%s
     autocmd FileType c,cpp setlocal cinoptions=:0,l1,t0,g0,(0
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

  " and load cfilter plugin
  autocmd QuickFixCmdPost * packadd cfilter
  augroup END

  augroup niceties
    autocmd!
    autocmd VimResized * wincmd =
  augroup END
endif
"" }}}

runtime! mywin.vim
runtime! statusline.vim

if g:machine =~ 'E3000*'
  set pythonthreedll=$USERPROFILE\AppData\Local\Continuum\miniconda3\python37.dll
  set pythonthreehome=$USERPROFILE\AppData\Local\Continuum\miniconda3\
elseif g:machine == 'CAPRICA'
  let g:FactorRoot = 'D:\factor'
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

"" VIM-SELECT https://github.com/habamax/vim-select {{{
" see mappings in ~/vimfiles/after/plugin/select.vim

let g:airline_filetype_overrides = {
      \ 'selectresults': [ '%#Statusline#%{select#statusline_type()}', '%{select#statusline_progress()}' ],
      \ }
"" }}}
