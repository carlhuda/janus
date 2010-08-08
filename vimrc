set nocompatible

set number
set ruler
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\|_,trail:.

" Indenting
filetype plugin indent on

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" make and python use real tabs
autocmd FileType make   set noexpandtab
autocmd FileType python set noexpandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function ChangeDirectory(dir)
  execute "cd " . a:dir

  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      wincmd p
    endif
  endif
endfunction

command -nargs=1 -complete=file ChangeDir :call ChangeDirectory(<f-args>)
cabbrev cd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ChangeDir' : 'cd')<CR>
