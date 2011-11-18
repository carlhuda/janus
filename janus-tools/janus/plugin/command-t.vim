if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>

  map <D-t> :CommandT<CR>
  imap <D-t> <ESC>:CommandT<CR>

  map <D-M-t> :CommandTFlush<CR>
  imap <D-M-t> <ESC>:CommandTFlush<CR>
else
  map <C-t> :CommandT<CR>
  imap <C-t> <ESC>:CommandT<CR>

  map <C-M-t> :CommandTFlush<CR>
  imap <C-M-t> <ESC>:CommandTFlush<CR>
endif

map <M-t> :CommandTBuffer<CR>
imap <M-t> <ESC>:CommandTBuffer<CR>
