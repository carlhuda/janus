""
"" Helpers
""

" Some file types should wrap their text
function s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

let s:current_file = expand("<sfile>:p")

function s:add_group(name)
  let resolved = resolve(s:current_file)
  let dir = fnamemodify(resolved, ":h")
  let file = dir . "/" . a:name
  call pathogen#runtime_prepend_subdirectories(file)
endfunction

""
"" Customizations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


""
"" Pathogen Setup
""

call s:add_group("janus-core")
call s:add_group("janus-langs")
call s:add_group("janus-tools")
call s:add_group("janus-command-t")

call pathogen#runtime_append_all_bundles()

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                            " don't wrap lines
set tabstop=2                         " a tab is two spaces
set shiftwidth=2                      " an autoindent (with <<) is two spaces
set expandtab	                        " use spaces, not tabs
set list listchars=tab:\ \ ,trail:.   " a tab should display as "  ", trailing whitespace as "."
set backspace=indent,eol,start        " backspace through everything in insert mode
  let macvim_hig_shift_movement = 1     " mvim shift-arrow-keys (required in vimrc)


""
"" Searching
""

set hlsearch    " highlight matches (TODO: Map something convenient to nohlsearch)
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Tab Completion
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full
" set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

""
"" Status bar
""

set laststatus=2  " always show the status bar

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" remember last position in file
" see :help last-position-jump
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

""
"" File Types
""

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" Set the Ruby filetype for a number of common Ruby files without .rb
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Markdown and txt files should wrap
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} call s:setupWrapping()

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79


""
"" General Mappings (Normal, Visual, Operator-pending)
""

" Opens the directory browser for the directory of the current path.
" <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Open the directory browser for the directory of the current path in a
" new tab. <Leader>te
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


""
"" Command-Line Mappings
""

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"


""
"" Customizations
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

