" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  call janus#add_mapping('nerdcommenter', 'map', '<D-/>', '<plug>NERDCommenterToggle<CR>')
  call janus#add_mapping('nerdcommenter', 'imap', '<D-/>', '<Esc><plug>NERDCommenterToggle<CR>i')
else
  call janus#add_mapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')
endif
