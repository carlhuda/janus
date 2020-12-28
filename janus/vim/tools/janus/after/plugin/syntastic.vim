if janus#is_plugin_enabled('syntastic')
  if globpath(&runtimepath, 'plugin/airline.vim', 1) ==# '' && globpath(&runtimepath, 'plugin/lightline.vim', 1) ==# '' && globpath(&runtimepath, 'plugin/powerline.vim', 1) ==# ''
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
  endif

  let g:syntastic_mode_map = {'mode': 'passive'}

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_warning_symbol = 'W>'
  let g:syntastic_error_symbol = 'E>'
  let g:syntastic_style_warning_symbol = 'W}'
  let g:syntastic_style_error_symbol = 'E}'

  let g:syntastic_stl_format = '[%E{E:%e(#%fe)}%B{,}%W{W:%w(#%fw)}]'
endif
