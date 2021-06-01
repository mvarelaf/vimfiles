"" VIMTODO https://github.com/mivok/vimtodo {{{
" let g:todo_states=[['TODO(t)', '|', 'DONE(d)', 'CANCELLED(c)'],
"       \['START(s)', 'END(e)'],
"       \['WAITING(w)', 'HOLD(h)', 'INPROGRESS(i)', 'SOMEDAY(y)', 'CLOSED(l)']]
let g:todo_states=[['TODO(t)', '|', 'DONE(d)'],
      \['START(s)', 'END(e)', 'CLOSED(l)' ],
      \['WAITING(w)', 'HOLD(h)', 'INPROGRESS(i)', 'SOMEDAY(y)', 'CANCELLED(c)']]

if &background == 'dark'
  let g:todo_state_colors= {
    \'TODO': 'Yellow',
    \'DONE': 'Green',
    \'CANCELLED': 'Red',
    \'STOP': 'Grey',
    \'START': 'Cyan',
    \'WAITING': 'Brown',
    \'HOLD': 'Grey',
    \'INPROGRESS': 'Cyan',
    \'SOMEDAY': 'Grey',
    \'CLOSED': 'Grey'}
else
  let g:todo_state_colors= {
    \'TODO': 'Blue',
    \'DONE': 'Green',
    \'CANCELLED': 'Red',
    \'STOP': 'Grey',
    \'START': 'Cyan',
    \'WAITING': 'Brown',
    \'HOLD': 'Grey',
    \'INPROGRESS': 'Cyan',
    \'SOMEDAY': 'Grey',
    \'CLOSED': 'Grey'}
endif
""}}}
