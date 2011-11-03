" Gundo requires Python
if !has("python")
  call janus#disable_plugin("gundo")
endif

" CommandT requires ruby
if !has("ruby")
  call janus#disable_plugin("command-t")
endif
