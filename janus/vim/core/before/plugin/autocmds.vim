if has("autocmd")
  if exists("g:autosave_on_blur")
    au FocusLost * silent! wall
  endif
endif
