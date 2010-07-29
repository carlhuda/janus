set nocompatible

set number
syntax on

" Whitespace stuff
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
