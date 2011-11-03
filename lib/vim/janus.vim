if exists("g:janus_loaded")
  finish
endif
let g:janus_loaded = 1

" Add a group of plug-ins to Pathogen
"
" @param [String] The plugin name
function! janus#add_group(name)
  if !exists("g:janus_loaded_groups")
    let g:janus_loaded_groups = []
  endif

  call add(g:janus_loaded_groups, a:name)
  call pathogen#runtime_prepend_subdirectories(g:janus_path . pathogen#separator() . a:name)
endfunction
