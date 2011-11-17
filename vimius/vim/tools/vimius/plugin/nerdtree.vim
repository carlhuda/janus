if vimius#is_plugin_enabled("nerdtree")
  let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.class$', '\.o', '\~$']
endif

call vimius#add_mapping('nerdtree', 'map', '<Leader>n', ':NERDTreeToggle<CR>')
