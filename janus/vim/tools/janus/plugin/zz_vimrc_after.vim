" Customization
"
" This loads as part of the plugins so that janus-specific plugin mappings can
" be overwritten.

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
