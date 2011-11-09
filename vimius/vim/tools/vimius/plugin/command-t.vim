if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>

  call vimius#add_mapping('command-t', 'map', '<D-t>', ':CommandT<CR>')
  call vimius#add_mapping('command-t', 'imap', '<D-t>', '<ESC>:CommandT<CR>')

  call vimius#add_mapping('command-t', 'map', '<D-A-t>', ':CommandTFlush<CR>')
  call vimius#add_mapping('command-t', 'imap', '<D-A-t>', '<ESC>:CommandTFlush<CR>')
else
  call vimius#add_mapping('command-t', 'map', '<C-t>', ':CommandT<CR>')
  call vimius#add_mapping('command-t', 'imap', '<C-t>', '<ESC>:CommandT<CR>')

  call vimius#add_mapping('command-t', 'map', '<C-A-t>', ':CommandTFlush<CR>')
  call vimius#add_mapping('command-t', 'imap', '<C-A-t>', '<ESC>:CommandTFlush<CR>')
endif

call vimius#add_mapping('command-t', 'map', '<A-t>', ':CommandTBuffer<CR>')
call vimius#add_mapping('command-t', 'imap', '<A-t>', '<ESC>:CommandTBuffer<CR>')
