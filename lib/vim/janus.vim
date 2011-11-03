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

" Which group contains a plugin ?
"
" @param [String] The plugin name
" @return [String] The group name
function! janus#which_group(name)
  if !exists("g:janus_loaded_groups")
    return ""
  endif

  for group in g:janus_loaded_groups
    if isdirectory(janus#plugin_path(a:name, group))
      return group
    endif
  endfor
endfunction

" Disable a plugin
"
" @param [String] The plugin name
function! janus#disable_plugin(name)
  if !exists("g:pathogen_disabled")
    let g:pathogen_disabled = []
  endif
  if !exists("g:janus_disabled_plugins")
    let g:janus_disabled_plugins = []
  endif
  " Find the plugin path
  let plugin_path = janus#plugin_path(a:name)
  " Add it to janus_disabled_plugins
  call add(g:janus_disabled_plugins, plugin_path)
  " Add it to pathogen_disabled
  call add(g:pathogen_disabled, plugin_path)
endfunction

" Return the plugin path
"
" @param [String] The plugin name
" @param [String] Optional the group name
" @return [String] The plugin name
function! janus#plugin_path(...)
  if a:0 < 1 || a:0 > 2
    return ""
  elseif a:0 == 1
    " Fetch the group name of the plugin
    let group = janus#which_group(a:1)
  else
    " Assigns the group to the argument
    let group = a:2
  endif

  return group . pathogen#separator() . a:1
endfunction

" Is plugin disabled?
"
" @param [String] The plugin name
function! janus#is_plugin_disabled(name)
  if !exists("g:janus_disabled_plugins")
    return 0
  endif
  return index(g:janus_disabled_plugins, janus#plugin_path(a:name)) != -1
endfunction
