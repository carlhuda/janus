if janus#is_plugin_enabled("narrowregion")
  " Change default key mapping in order to eliminate delay related with
  " NERDTree using the same starting sequence <leader>n
  silent! nunmap <leader>nr
  call janus#add_mapping('narrowregion', 'map', '<leader>rn', ':NarrowRegion<CR>')
endif
