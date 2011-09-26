if filereadable(expand("~/.gvimrc.before"))
  source ~/.gvimrc.before
endif

" Remapping menus must be done in gvimrc
if g:command_t_loaded
  if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    imap <D-t> <Esc>:CommandT<CR>
  endif
endif

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif

syntax enable
set background=light
colorscheme solarized
