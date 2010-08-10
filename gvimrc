
" Apple-T for CommandT
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
endif
