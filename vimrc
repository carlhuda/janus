""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

""
"" Janus setup
""

" Define the janus_path
let g:janus_path = fnamemodify(resolve(expand("<sfile>:p")), ":h")

" Source janus
source ~/.vim/lib/vim/janus.vim

""
"" Pathogen Setup
""

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("janus-tools")
call janus#add_group("janus-langs")
call janus#add_group("janus-colors")
call janus#add_group("janus-core")

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""
"" Customizations
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
