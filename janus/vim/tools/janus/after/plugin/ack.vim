if has("gui_macvim") && has("gui_running")
  " Command-Shift-F on OSX
  call janus#add_mapping('ack', 'map', '<D-F>', ':Ack<space>')
else
  " Define <C-F> to a dummy value to see if it would set <C-f> as well.
  map <C-F> :dummy

  if maparg("<C-f>") == ":dummy"
    " <leader>f on systems where <C-f> == <C-F>
    call janus#add_mapping('ack', 'map', '<leader>f', ':Ack<space>')
  else
    " <C-F> if we can still map <C-f> to <S-Down>
    call janus#add_mapping('ack', 'map', '<C-F>', ':Ack<space>')
  endif

  map <C-f> <S-Down>
endif
