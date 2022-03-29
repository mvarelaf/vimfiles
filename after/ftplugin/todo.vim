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
