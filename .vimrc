set nocompatible

" UI stuff
set number
set ruler
set laststatus=2
set showcmd
set scrolloff=5             " min # of lines above/below the cursor to keep onscreen

" use TAB for autocomplete
set wildmenu
set complete-=i

" tab width/indentation stuff
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set smarttab

" search in file as I type, case-insensitive
set incsearch
set ignorecase
set smartcase

" disable backups but enable persistent undo
set nobackup
set writebackup
set undodir=~/.vim/undo
set undofile

" timeout key mapping after 1s
set ttimeout
set ttimeoutlen=1000

" misc stuff
set nrformats-=octal
set backspace=indent,eol,start
set autoread                        " reload file when modified elsewhere

filetype plugin indent on
syntax on
au BufReadPost *.atom set syntax=xml
