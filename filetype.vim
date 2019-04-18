" my filetype file
if exists("g:did_load_my_filetypes")
  finish
endif
let g:did_load_my_filetypes=1

augroup filetypedetect
  au! BufRead,BufNewFile *.k    setfiletype k
  au! BufRead,BufNewFile *.q    setfiletype q
  au! BufRead,BufNewFile *.s    setfiletype sql
  au! BufRead,BufNewFile *.csv  setfiletype csv
augroup END
