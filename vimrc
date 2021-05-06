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
  call packager#add('lifepillar/vim-mucomplete')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-unimpaired')
  " call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-vinegar')
  " call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-fugitive')
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
  call packager#add('mivok/vimtodo')
  call packager#add('svermeulen/vim-yoink')
  call packager#add('vimwiki/vimwiki')
  " call packager#add('stefandtw/quickfix-reflector.vim')
  call packager#add('tommcdo/vim-exchange')
  call packager#add('haya14busa/vim-asterisk')
  call packager#add('tyru/open-browser.vim')
  " call packager#add('dense-analysis/ale')
  call packager#add('flazz/vim-colorschemes')
  call packager#add('ryanoasis/vim-devicons')
  " call packager#add('justinmk/vim-dirvish')
  " call packager#add('t9md/vim-choosewin')
  call packager#add('yegappan/bufselect')
  " call packager#add('jlanzarotta/bufexplorer')
  " call packager#add('mtth/cursorcross.vim')
  " call packager#add('drmikehenry/vim-fontsize')
  call packager#add('preservim/tagbar')
  "call packager#add('')
  "call packager#local('~/my_vim_plugins/my_awesome_plugin')

  "Loaded only for specific filetypes on demand. Requires autocommands below.
  call packager#add('chrisbra/csv.vim', { 'type': 'opt' })
  call packager#add('tpope/vim-markdown', { 'type': 'opt' })
  call packager#add('masukomi/vim-markdown-folding', { 'type': 'opt' })
  " call packager#add('wlangstroth/vim-racket', { 'type': 'opt' })
  " call packager#add('bhurlow/vim-parinfer', { 'type': 'opt' })
  " call packager#add('jpalardy/vim-slime', { 'type': 'opt' })
  call packager#add('jalvesaq/Nvim-R', { 'type': 'opt', 'branch': 'stable' })
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  autocmd FileType markdown packadd vim-markdown
  autocmd FileType markdown packadd vim-markdown-folding
  autocmd FileType csv packadd csv.vim
  autocmd FileType racket packadd vim-racket
  autocmd FileType racket,scheme,lisp packadd vim-parinfer
  autocmd FileType racket,scheme,lisp packadd vim-slime
  autocmd FileType r packadd Nvim-R
augroup END

""" }}}

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
"" END OF COPIED FROM https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim }}}

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

set shortmess-=I    " don't give the intro message when starting Vim
set shortmess+=r    " use "[RO]" instead of "[readonly]"
set shortmess+=m    " use "[+]" instead of "[Modified]"
set shortmess-=S    " show search count message when searching, e.g. [1/5]"
set shortmess+=n    " n use "[New]" instead of "[New File]"
set shortmess+=w    " w use "[w]" instead of "written" for file write message
                    " and "[a]" instead of "appended" for ':w >> file' command
set shortmess+=x    " x use "[dos]" instead of "[dos format]", "[unix]" instead of
                    "[unix format]" and "[mac]" instead of "[mac format]".

set suffixes+=.pyc,.pyo,.egg-info,.class

set wildmode=longest,full

if has('wildignore')
  set wildignorecase
  set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*~,*.tmp
  set wildignore+=.git,.hg,.svn
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=*.aux,*.out,*.toc        " LaTeX intermediate files
  set wildignore+=.DS_Store                " Mac
  set wildignore+=*.a,*.pdb,*.lib "stuff to ignore when tab completing
  set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
  set wildignore+=*.so,*.dll,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
  " set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
  set wildignore+=*.ipch,*.gem
  set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
  set wildignore+=*/.Trash/**,*.dmg,*/.rbenv/**
  set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
  set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
  set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
  set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
  set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
  set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.msu
  set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
  set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
  set wildignore+=tags

endif

set nojoinspaces " Use only 1 space after "." when joining lines, not 2

if has('insert_expand')
  set completeopt=menuone,noinsert,noselect
endif

set splitright
set splitbelow

set noequalalways

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

"" OPEN-BROWSER https://github.com/tyru/open-browser.vim {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"" }}}

"" VIM-CHOOSEWIN https://github.com/t9md/vim-choosewin {{{
" nmap <leader>w <Plug>(choosewin)
" let g:choosewin_blink_on_land = 0
" " let g:choosewin_return_on_single_win = 1
"" }}}

"" VIM-ASTERISK https://github.com/haya14busa/vim-asterisk {{{
let g:asterisk#keeppos = 1

map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
"" }}}

"" MUCOMPLETE https://github.com/lifepillar/vim-mucomplete {{{
set shortmess+=c    " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1000 " 1 second

" let g:mucomplete#chains = { 'sql' : ['file', 'sqla', 'keyn'] }
let g:mucomplete#chains = { 'sql' : ['file', 'keyn'] }

function! MU()
  if exists("g:loaded_mucomplete")
    return get(g:mucomplete#msg#short_methods,
        \      get(g:, 'mucomplete_current_method', ''), '')
    else
      return ''
    endif
endf
""" }}}

"" Abbreviations {{{
iab _hoy <C-R>=strftime("%d.%m.%Y")<CR>
iab _time <C-R>=strftime("%H:%M:%S")<CR>
iab _dates <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
"iab _fecha <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab _date <C-R>=strftime("%A %d %B %Y %H:%M")<CR>
iab _iso_date <C-R>=strftime("%FT%T%z")<CR>
iab _rfc_date <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>

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

"" STARTIFY https://github.com/mhinz/vim-startify {{{
let g:startify_change_to_vcs_root = 1

let g:startify_session_dir=expand("$USERPROFILE").'\vimfiles\startify-sessions'

if g:machine =~ 'E3000*'
  let g:startify_custom_header = []
  let g:startify_bookmarks = [
        \ {'p': expand("$USERPROFILE").'\Desktop\INFOP.txt' },
        \ {'c': expand("$USERPROFILE").'\vimfiles\vimrc' }
        \ ]
else
  let g:startify_bookmarks = [
        \ {'c': expand("$USERPROFILE").'\vimfiles\vimrc' }
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

"" SAYONARA https://github.com/mhinz/vim-sayonara {{{
nnoremap <silent> <leader>q :Sayonara!<cr>
"" }}}

"" DISPATCH https://github.com/tpope/vim-dispatch {{{
" let g:dispatch_no_maps = 1
"" }}}

"" SPEEDDATING https://github.com/tpope/vim-speeddating {{{
" let g:speeddating_no_mappings = 1
" nmap  <C-A>     <Plug>SpeedDatingUp
" nmap  <C-X>     <Plug>SpeedDatingDown
" vmap  <C-A>     <Plug>SpeedDatingUp
" vmap  <C-K>     <Plug>SpeedDatingDown
" nmap d<C-A>     <Plug>SpeedDatingNowUTC
" nmap d<C-X>     <Plug>SpeedDatingNowLocal
"" }}}

"" VIMTODO https://github.com/mivok/vimtodo {{{
if &background == 'dark'
  let g:todo_state_colors= {
    \'DONE': 'Green',
    \'CLOSED': 'Grey',
    \'CANCELLED': 'Red',
    \'TODO': 'Yellow',
    \'WAITING': 'Brown',
    \'HOLD': 'Grey',
    \'INPROGRESS': 'Cyan',
    \'SOMEDAY': 'Grey'}
else
  let g:todo_state_colors= {
    \'DONE': 'Green',
    \'CLOSED': 'Grey',
    \'CANCELLED': 'Red',
    \'TODO': 'Blue',
    \'WAITING': 'Brown',
    \'HOLD': 'Grey',
    \'INPROGRESS': 'Cyan',
    \'SOMEDAY': 'Grey'}
endif
""}}}

"" YOINK https://github.com/svermeulen/vim-yoink {{{
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" let g:yoinkAutoFormatPaste = 1
""}}}

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

"" VIM-SLIME https://github.com/jpalardy/vim-slime {{{
let g:slime_target = "vimterminal"
"" }}}

"" ALE https://github.com/dense-analysis/ale {{{
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" " let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
"" }}}

" Poor man bufexplorer
nnoremap <leader>ls :ls<CR>:b<space>

"" BUFEXPLORER https://github.com/jlanzarotta/bufexplorer {{{
" let g:bufExplorerFindActive=0        " Do not go to active window.
"" }}}

"" BUFSELECT https://github.com/yegappan/bufselect {{{
nmap <F2> <Plug>Bufselect_Toggle
nnoremap <leader>b :Bufselect<CR>
"" }}}

if has('autocmd')
  if has('gui')
    augroup cursor_line
      autocmd!
      au VimEnter * set cursorline
      au WinLeave,InsertEnter * set nocursorline
      au WinEnter,InsertLeave * set cursorline
    augroup END
  endif
endif

"" CURSORCROSS https://github.com/mtth/cursorcross.vim {{{
" let g:cursorcross_dynamic = 'lw'
" let g:cursorcross_mappings = 0 " Interferes with dirvish
"" }}}

"" VIM-MARKDOWN-FOLDING https://github.com/mvarelaf/vim-markdown-folding {{{
" de upstream https://github.com/masukomi/vim-markdown-folding
let g:markdown_fold_indent_title = 1
"" }}}

" AIRLINE https://github.com/vim-airline/vim-airline {{{
set noshowmode

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
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }
" }}}

"" Status bar colors
"au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
"au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
"" au InsertEnter * hi statusline guibg=#d7afff ctermbg=magenta
"" au InsertLeave * hi statusline guibg=#8fbfdc ctermbg=cyan
"hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
" set statusline+=%3*│                                     " Separator
" set statusline+=%2*\ %Y\                                 " FileType
" set statusline+=%3*│                                     " Separator
" set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
" set statusline+=\(%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
" set statusline+=%3*│                                     " Separator
set statusline+=%0*\ %l/%L,%02v\ %p%%\                     " Line number / total lines, percentage of document
" set statusline+=%1*\ %02l/%L,%02v\ %p%%\                " Line number / total lines, percentage of document

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" set statusline=%f\ [%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
        " \\ &&\ &bomb)?\",B\":\"\")}][%{&ff}]
        " \\%m%r%w%y\ %k\ %=%l/%L,%v\ %p%%

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

" Highlight all occurrences of current word without moving
" nnoremap <leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Open files located in the same dir in with the current file is edited
nnoremap <leader>ecd :e <C-R>=expand("%:.:h") . "/"<CR>
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

vnoremap <silent> <S-F1> :retab

" Visual select last paste
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'

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
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <C-Left><C-Left><Right><C-R>=Eatchar('\s')<CR>
cabbrev ESearch
      \ vimgrep /\<lt>\>/j
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <C-Left><C-Left><Right><Right><Right><C-R>=Eatchar('\s')<CR>

"" AUTOCMD {{{
if has('autocmd')
  augroup fileTypes
  autocmd!
  autocmd Filetype todo setlocal tabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2 textwidth=79
  autocmd FileType xml setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType json setlocal tabstop=3 noexpandtab shiftwidth=3
  autocmd FileType text setlocal tabstop=2 shiftwidth=2 textwidth=79 syntax=txt
  autocmd FileType text setlocal commentstring=/*%s*/ " used by commentary.vim
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
  autocmd QuickFixCmdPost *grep* cwindow
  augroup END
endif
"" }}}

runtime! mywin.vim

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

"" TAGBAR https://github.com/preservim/tagbar {{{
" https://github.com/majutsushi/tagbar
nmap <F12> :TagbarToggle<CR>

"" }}}

"" FONTSIZE https://github.com/drmikehenry/vim-fontsizelet {{{
" let g:fontsize#timeout = 0
"" }}}
