" Gundo and pep8 requires Python
if !has("python")
  call janus#disable_plugin("gundo", "Vim is compiled without python support")
  call janus#disable_plugin("pep8", "Vim is compiled without python support")
endif

" CommandT requires ruby
if !has("ruby")
  call janus#disable_plugin("command-t", "Vim is compiled without ruby support")
endif

" Pep8 requires pep8 installed
if !executable("pep8")
  call janus#disable_plugin("pep8", "The pep8 program is not installed")
endif

" Ack requires ack command
if !executable("ack")
  call janus#disable_plugin("ack", "The ack program is not installed")
endif
