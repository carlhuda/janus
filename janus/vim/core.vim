" Source the functions
source ~/.vim/janus/vim/core/janus/before/plugin/janus.vim

" Source Janus core.
for f in janus#vim_files("~/.vim/janus/vim/core")
  exe 'source ' . f
endfor
