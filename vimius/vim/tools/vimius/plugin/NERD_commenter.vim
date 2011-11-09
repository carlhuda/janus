" NERDCommenter mappings
if has("gui_macvim")
  call vimius#add_mapping('nerdcommenter', 'map', '<D-/>', '<plug>NERDCommenterToggle<CR>')
  call vimius#add_mapping('nerdcommenter', 'imap', '<D-/>', '<Esc><plug>NERDCommenterToggle<CR>i')
else
  call vimius#add_mapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')
  call vimius#add_mapping('nerdcommenter', 'imap', '<leader>/', '<Esc><plug>NERDCommenterToggle<CR>i')
endif
