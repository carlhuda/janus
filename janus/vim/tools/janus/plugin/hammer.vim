if janus#is_plugin_enabled('hammer')
  function! s:setupMarkup()
    call janus#add_mapping('hammer', 'map <buffer>', '<Leader>p', ':Hammer<CR>')
  endfunction

  if executable("redcarpet") && has("autocmd")
    " define buffer-local preview for markdown files
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
  endif

  if executable("redcloth") && has("autocmd")
    " define buffer-local preview for textile files
    au BufRead,BufNewFile *.textile call s:setupMarkup()
  endif
endif
