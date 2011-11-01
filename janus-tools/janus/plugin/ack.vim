if has("gui_macvim")
  " Command-Shift-F for Ack on mac
  map <D-F> :Ack<space>
else
  " Control-Shift-F on other systems
  map <C-F> :Ack<space>
endif
