""
"" Janus main functions
""

" Return a path separator on the current OS
" Taken from pathogen
"
" @return [String] The separator / or \
function! janus#separator()
  return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction

" Find vim files inside a folder
"
" @param [String] The path to a folder
" @return [List] List of files.
function! janus#vim_files(folder)
  let files = []
  let pattern = resolve(expand(a:folder)) . janus#separator() . "*"
  " Add all found vim files
  for file in split(glob(pattern), "\n")
    if isdirectory(file)
      call extend(files, janus#vim_files(file))
    elseif (file =~ "\.vim$")
      call add(files, file)
    endif
  endfor

  return files
endfunction

" Add a group of plug-ins to Pathogen
"
" @param [String] The plugin name
function! janus#add_group(name)
  if !exists("g:janus_loaded_groups")
    let g:janus_loaded_groups = []
  endif

  call add(g:janus_loaded_groups, a:name)
  call pathogen#runtime_prepend_subdirectories(g:janus_vim_path. janus#separator() . a:name)
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
    if isdirectory(janus#plugin_path(group, a:name))
      return group
    endif
  endfor
endfunction

" Disable a plugin
"
" @param [String] The group the plugin belongs to, will be determined if
"                 no group were given.
" @param [String] The plugin name
" @param [String] The reason why it is disabled
" @return [Bool]
function! janus#disable_plugin(...)
  if a:0 < 1 || a:0 > 3
    throw "The arguments to janus#disable_plugin() should bw [group], <name>, [reason]"
  elseif a:0 == 1
    let group = -1
    let name = a:1
    let reason = -1
  elseif a:0 == 2
    let group = -1
    let name = a:1
    let reason = a:2
  elseif a:0 == 3
    let group = a:1
    let name = a:2
    let reason = a:3
  endif

  " Verify the existance of the global variables
  if !exists("g:pathogen_disabled")
    let g:pathogen_disabled = []
  endif
  if !exists("g:janus_disabled_plugins")
    let g:janus_disabled_plugins = {}
  endif

  " Fetch the group if necessary
  if group == -1
    let group = janus#which_group(name)
  endif

  " Check if we need to add it
  if has_key(g:janus_disabled_plugins, name) && g:janus_disabled_plugins[name]['group'] == group
    " Just update the reason if necessary.
    if reason != "No reason given." && g:janus_disabled_plugins[name]['reason'] == -1
      let g:janus_disabled_plugins[name]['reason'] = reason
    endif

    return 0
  endif

  " Find the plugin path
  let plugin_path = janus#plugin_path(group, name)

  " Add it to janus_disabled_plugins
  let g:janus_disabled_plugins[name] = {'group': group, 'path': plugin_path, 'reason': reason}

  " Add it to pathogen_disabled
  call add(g:pathogen_disabled, plugin_path)
endfunction

" Return the plugin path
"
" @param [String] The group the plugin belongs to, will be determined if
"                 no group were given.
" @param [String] The plugin name
" @return [String] The plugin path relative to g:janus_vim_path
function! janus#plugin_path(...)
  if a:0 < 1 || a:0 > 2
    throw "The arguments to janus#plugin_path() should be [group], <name>"
  elseif a:0 == 1
    let name  = a:1
    let group = janus#which_group(name)
  else
    let group = a:1
    let name  = a:2
  endif

  return g:janus_vim_path . janus#separator() . group . janus#separator() . name
endfunction

" Is modules loaded?
"
" @param [String] The plugin name
" @return [Boolean]
function! janus#is_module_loaded(name)
  return len(janus#vim_files(janus#plugin_path(a:name))) > 0
endfunction

" Is plugin disabled?
"
" @param [String] The plugin name
function! janus#is_plugin_disabled(name)
  if !exists("g:janus_disabled_plugins")
    return 0
  endif

  return has_key(g:janus_disabled_plugins, a:name)
endfunction

" Is plugin enabled?
"
" @param [String] The plugin name
" @return [Boolean]
function! janus#is_plugin_enabled(name)
  return janus#is_module_loaded(a:name) && !janus#is_plugin_disabled(a:name)
endfunction

" Mapping function
"
" @param [String] The plugin name
" @param [String] The mapping command (map, vmap, nmap or imap)
" @param [String] The mapping keys
" @param [String]* The mapping action
function! janus#add_mapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    throw "The arguments to janus#add_mapping() should be <name> <mapping_command> <mapping_keys> <mapping_action> [mapping_action]*"
  endif

  if janus#is_plugin_enabled(a:name)
    let mapping_command = join(a:000)
  else
    if !janus#disable_plugin(a:name)
      let reason = "Module is not loaded"
    elseif g:janus_disabled_plugins[a:name]['reason'] == -1
      return 0
    else
      let reason = g:janus_disabled_plugins[a:name]['reason']
    endif

    let mapping_command = "<ESC>:echo 'The plugin " . a:name . " is disabled for the following reason: " . reason . ".'<CR>"
  endif

  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction
