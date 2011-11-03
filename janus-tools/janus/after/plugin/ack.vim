if has("gui_macvim")
  " Command-Shift-F on OSX
  map <D-F> :Ack<space>
else
  " Control-Shift-F on other systems
  map <C-F> :Ack<space>
endif
