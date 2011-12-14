if janus#is_plugin_enabled('gist')
  if executable("pbcopy")
    " The copy command
    let g:gist_clip_command = 'pbcopy'
  elseif executable("xclip")
    " The copy command
    let g:gist_clip_command = 'xclip -selection clipboard'
  elseif executable("putclip")
    " The copy command
    let g:gist_clip_command = 'putclip'
  end

  " detect filetype if vim failed auto-detection.
  let g:gist_detect_filetype = 1
endif
