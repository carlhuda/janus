if janus#is_plugin_enabled("nerdtree")
  let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.class$', '\.o', '\~$']
endif

call janus#add_mapping('nerdtree', 'map', '<Leader>n', ':NERDTreeToggle<CR>')
