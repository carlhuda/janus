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

" Find vim files inside a folder
"
" @param [String] The path to a folder
" @return [List] List of files.
function! vimius#vim_files(folder)
  let files = []
  let pattern = resolve(expand(a:folder)) . vimius#separator() . "*"
  " Add all found vim files
  for file in split(glob(pattern), "\n")
    if isdirectory(file)
      call extend(files, vimius#vim_files(file))
    elseif (file =~ "\.vim$")
      call add(files, file)
    endif
  endfor

  return files
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
    if isdirectory(vimius#plugin_path(group, a:name))
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
function! vimius#disable_plugin(...)
  if a:0 < 1 || a:0 > 3
    throw "The arguments to vimius#disable_plugin() should bw [group], <name>, [reason]"
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
  if !exists("g:vimius_disabled_plugins")
    let g:vimius_disabled_plugins = {}
  endif

  " Fetch the group if necessary
  if group == -1
    let group = vimius#which_group(name)
  endif

  " Check if we need to add it
  if has_key(g:vimius_disabled_plugins, name) && g:vimius_disabled_plugins[name]['group'] == group
    " Just update the reason if necessary.
    if reason != "No reason given." && g:vimius_disabled_plugins[name]['reason'] == -1
      let g:vimius_disabled_plugins[name]['reason'] = reason
    endif

    return 0
  endif

  " Find the plugin path
  let plugin_path = vimius#plugin_path(group, name)

  " Add it to vimius_disabled_plugins
  let g:vimius_disabled_plugins[name] = {'group': group, 'path': plugin_path, 'reason': reason}

  " Add it to pathogen_disabled
  call add(g:pathogen_disabled, plugin_path)
endfunction

" Return the plugin path
"
" @param [String] The group the plugin belongs to, will be determined if
"                 no group were given.
" @param [String] The plugin name
" @return [String] The plugin path relative to g:vimius_vim_path
function! vimius#plugin_path(...)
  if a:0 < 1 || a:0 > 2
    throw "The arguments to vimius#plugin_path() should be [group], <name>"
  elseif a:0 == 1
    let name  = a:1
    let group = vimius#which_group(name)
  else
    let group = a:1
    let name  = a:2
  endif

  return g:vimius_vim_path . vimius#separator() . group . vimius#separator() . name
endfunction

" Is modules loaded?
"
" @param [String] The plugin name
" @return [Boolean]
function! vimius#is_module_loaded(name)
  return len(vimius#vim_files(vimius#plugin_path(a:name))) > 0
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

" Is plugin enabled?
"
" @param [String] The plugin name
" @return [Boolean]
function! vimius#is_plugin_enabled(name)
  return vimius#is_module_loaded(a:name) && !vimius#is_plugin_disabled(a:name)
endfunction

" Mapping function
"
" @param [String] The plugin name
" @param [String] The mapping command (map, vmap, nmap or imap)
" @param [String] The mapping keys
" @param [String]* The mapping action
function! vimius#add_mapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    throw "The arguments to vimius#add_mapping() should be <name> <mapping_command> <mapping_keys> <mapping_action> [mapping_action]*"
  endif

  if !vimius#is_plugin_disabled(a:name)
    let mapping_command = join(a:000)
  else
    if g:vimius_disabled_plugins[a:name]['reason'] == -1
      return 0
    endif

    let mapping_command = "<ESC>:echo 'The plugin " . a:name . " is disabled for the following reason: " . g:vimius_disabled_plugins[a:name]['reason'] . ".'<CR>"
  endif

  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction
