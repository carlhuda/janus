if janus#is_plugin_enabled("ctrlp")
  let g:ctrlp_map = ''
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }
endif

if has("gui_macvim") && has("gui_running")
  call janus#add_mapping('ctrlp', 'map', '<D-t>', ':CtrlP<CR>')
  call janus#add_mapping('ctrlp', 'imap', '<D-t>', '<ESC>:CtrlP<CR>')
endif
