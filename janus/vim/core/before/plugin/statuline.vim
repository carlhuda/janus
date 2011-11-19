if has("statusline") && !&cp
  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive if enabled
  if janus#is_plugin_enabled('fugitive')
    set statusline+=%{fugitive#statusline()}
  endif

  " Add syntastic if enabled
  if janus#is_plugin_enabled('syntastic')
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
  endif

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif
