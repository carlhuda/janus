if has("gui_macvim")
  " Command-Shift-F on OSX
  call janus#add_mapping('ack', 'map', '<D-F>', ':Ack<space>')
else
  " Control-Shift-F on other systems
  call janus#add_mapping('ack', 'map', '<C-F>', ':Ack<space>')
endif
