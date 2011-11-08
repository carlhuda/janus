function! s:setupMarkup()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

if executable("redcarpet")
  " define buffer-local preview for markdown files
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
endif

if executable("redcloth")
  " define buffer-local preview for textile files
  au BufRead,BufNewFile *.textile call s:setupMarkup()
endif
