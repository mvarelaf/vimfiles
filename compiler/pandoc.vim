" adapted from
" https://github.com/vim-pandoc/vim-pandoc/blob/master/compiler/pandoc.vim

if exists('current_compiler')
  finish
endif

let current_compiler = (exists('g:pandoc#compiler#command') ? g:pandoc#compiler#command : 'pandoc')
let compiler_args = (exists('g:pandoc#compiler#arguments') ? escape(' '.g:pandoc#compiler#arguments, '\ ') : '')

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat="%f",\ line\ %l:\ %m
execute 'CompilerSet makeprg='.current_compiler.compiler_args
