set number
set ruler

" tab width/indentation stuff
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround

" disable backups but enable persistent undo
set nobackup
set writebackup
set undodir=~/.vim/undo
set undofile

filetype indent on
syntax on
au BufReadPost *.atom set syntax=xml
