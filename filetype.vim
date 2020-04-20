" my filetype file
if exists("g:did_load_my_filetypes")
  finish
endif
let g:did_load_my_filetypes=1

augroup filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile *.k               setfiletype k
  autocmd BufRead,BufNewFile *.q               setfiletype q
  autocmd BufRead,BufNewFile *.s               setfiletype sql
  autocmd BufRead,BufNewFile *.csv             setfiletype csv
  autocmd BufRead,BufNewFile todo.txt,done.txt setfiletype todo
  autocmd BufRead,BufNewFile *.rkt,*.rktl      setfiletype racket
augroup END
