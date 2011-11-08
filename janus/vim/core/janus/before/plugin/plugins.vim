" Gundo and pep8 requires Python
if !has("python")
  call janus#disable_plugin("gundo")
  call janus#disable_plugin("pep8")
endif

" CommandT requires ruby
if !has("ruby")
  call janus#disable_plugin("command-t")
endif

" Pep8 requires pep8 installed
if !executable("pep8")
  call janus#disable_plugin("pep8")
endif

" Ack requires ack command
if !executable("ack")
  call janus#disable_plugin("ack")
endif
