if has("gui_macvim")
  " Command-Shift-F on OSX
  call janus#add_mapping('ack', 'map', '<D-F>', ':Ack<space>')
else
  if maparg("<C-F>") == ""
    " Control-Shift-F on other systems
    call janus#add_mapping('ack', 'map', '<C-F>', ':Ack<space>')
  else
    " >leader>f on systems where <C-f> == <C-F>
    call janus#add_mapping('ack', 'map', '<leader>f', ':Ack<space>')
  end
endif
