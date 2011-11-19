" Variables
let s:no_python_support = "Vim is compiled without python support"
let s:no_ruby_support = "Vim is compiled without ruby support"

" Plugins that requires python support
if !has("python")
  call vimius#disable_plugin("gundo", s:no_python_support)
  call vimius#disable_plugin("pep8", s:no_python_support)
endif

" Plugins that requires ruby support
if !has("ruby")
  call vimius#disable_plugin("command-t", s:no_ruby_support)
  call vimius#disable_plugin("ruby", s:no_ruby_support)
endif

" Pep8 requires pep8 installed
if !executable("pep8")
  call vimius#disable_plugin("pep8", "The pep8 program is not installed")
endif

" Ack requires ack command
if !executable("ack")
  call vimius#disable_plugin("ack", "The ack program is not installed")
endif

" Gist-vim requires curl
if !executable("curl")
  call vimius#disable_plugin("gist", "The curl program is not installed")
endif
