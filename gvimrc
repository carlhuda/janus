if has("gui_macvim")
  " Apple-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Apple-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
endif
