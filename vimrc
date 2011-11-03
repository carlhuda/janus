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

call janus#add_group("janus-core")
call janus#add_group("janus-langs")
call janus#add_group("janus-tools")
call janus#add_group("janus-colors")

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""
"" Customizations
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
