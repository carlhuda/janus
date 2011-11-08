if !janus#is_plugin_disabled("command-t")
  if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>

    map <D-t> :CommandT<CR>
    imap <D-t> <ESC>:CommandT<CR>

    map <D-A-t> :CommandTFlush<CR>
    imap <D-A-t> <ESC>:CommandTFlush<CR>
  else
    map <C-t> :CommandT<CR>
    imap <C-t> <ESC>:CommandT<CR>

    map <C-A-t> :CommandTFlush<CR>
    imap <C-A-t> <ESC>:CommandTFlush<CR>
  endif

  map <A-t> :CommandTBuffer<CR>
  imap <A-t> <ESC>:CommandTBuffer<CR>
endif
