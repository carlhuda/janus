""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

""
"" Pathogen Setup
""

let s:current_file = expand("<sfile>:p")

function! s:add_group(name)
  let resolved = resolve(s:current_file)
  let dir = fnamemodify(resolved, ":h")  . "/" . a:name
  call pathogen#runtime_prepend_subdirectories(dir)
endfunction

call s:add_group("janus-core")
call s:add_group("janus-langs")
call s:add_group("janus-tools")
call s:add_group("janus-colors")

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""
"" Customizations
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
