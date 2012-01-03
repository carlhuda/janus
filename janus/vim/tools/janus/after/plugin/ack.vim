if has("gui_macvim")
  " Command-Shift-F on OSX
  call janus#add_mapping('ack', 'map', '<D-F>', ':Ack<space>')
else
  " Control-Shift-F on other systems
  call janus#add_mapping('ack', 'map', '<C-F>', ':Ack<space>')

  " Check if we defined <C-f> in the process
  if maparg("<C-f>") == ":Ack "
    " >leader>f on systems where <C-f> == <C-F>
    call janus#add_mapping('ack', 'map', '<leader>f', ':Ack<space>')
    map <C-f> <S-Down>
  end
endif

