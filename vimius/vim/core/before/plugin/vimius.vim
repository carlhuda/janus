""
"" Vimius main functions
""

" Return a path separator on the current OS
" Taken from pathogen
"
" @return [String] The separator / or \
function! vimius#separator()
  return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction


" Add a group of plug-ins to Pathogen
"
" @param [String] The plugin name
function! vimius#add_group(name)
  if !exists("g:vimius_loaded_groups")
    let g:vimius_loaded_groups = []
  endif

  call add(g:vimius_loaded_groups, a:name)
  call pathogen#runtime_prepend_subdirectories(g:vimius_vim_path. vimius#separator() . a:name)
endfunction

" Which group contains a plugin ?
"
" @param [String] The plugin name
" @return [String] The group name
function! vimius#which_group(name)
  if !exists("g:vimius_loaded_groups")
    return ""
  endif

  for group in g:vimius_loaded_groups
    if isdirectory(vimius#plugin_path(a:name, group))
      return group
    endif
  endfor
endfunction

" Disable a plugin
"
" @param [String] The plugin name
" @param [String] The reason why it is disabled
" @return [Bool]
function! vimius#disable_plugin(...)
  if a:0 < 1
    " TODO: Should raise an error
    return ""
  elseif a:0 < 2
    let name = a:1
    let reason = "No reason given."
  else
    let name = a:1
    let reason = a:2
  endif

  " Verify the existance of the global variables
  if !exists("g:pathogen_disabled")
    let g:pathogen_disabled = []
  endif
  if !exists("g:vimius_disabled_plugins")
    let g:vimius_disabled_plugins = {}
  endif

  " Check if we need to add it
  if has_key(g:vimius_disabled_plugins, name)
    " Just update the reason if necessary.
    if reason != "No reason given." && g:vimius_disabled_plugins[name]['reason'] == "No reason given."
      let g:vimius_disabled_plugins[name]['reason'] = reason
    endif

    return 0
  endif

  " Find the plugin path
  let plugin_path = vimius#plugin_path(name)

  " Add it to vimius_disabled_plugins
  let g:vimius_disabled_plugins[name] = {'path': plugin_path, 'reason': reason}

  " Add it to pathogen_disabled
  call add(g:pathogen_disabled, plugin_path)
endfunction

" Return the plugin path
"
" @param [String] The plugin name
" @param [String] Optional the group name
" @return [String] The plugin name
function! vimius#plugin_path(...)
  if a:0 < 1 || a:0 > 2
    " TODO: Should raise an error
    return ""
  elseif a:0 == 1
    " Fetch the group name of the plugin
    let group = vimius#which_group(a:1)
  else
    " Assigns the group to the argument
    let group = a:2
  endif

  return g:vimius_vim_path . vimius#separator() . group . vimius#separator() . a:1
endfunction

" Is plugin disabled?
"
" @param [String] The plugin name
function! vimius#is_plugin_disabled(name)
  if !exists("g:vimius_disabled_plugins")
    return 0
  endif
  return has_key(g:vimius_disabled_plugins, a:name)
endfunction

" Mapping function
"
" @param [String] The plugin name
" @param [String] The mapping command (map, vmap, nmap or imap)
" @param [String] The mapping keys
" @param [String]* The mapping action
function! vimius#add_mapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    " TODO: Should raise an error
    return 0
  endif

  if !vimius#is_plugin_disabled(a:name)
    let mapping_command = join(a:000)
  else
    let mapping_command = "<ESC>:echo 'The plugin " . a:name . " is disabled for the following reason: " . g:vimius_disabled_plugins[a:name]['reason'] . ".'<CR>"
  endif

  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction
