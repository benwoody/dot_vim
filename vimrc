call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set backup
set backupdir=~/.tmp/swp
set directory=~/.tmp/swp

colorscheme vividchalk
syntax on
filetype plugin indent on
filetype indent on
filetype plugin on

set t_Co=256
set nocompatible
set backspace=indent,eol,start
set autoindent
set history=50
set ruler
set laststatus=2
set showcmd
set incsearch
set number
set shiftwidth=2
set softtabstop=2

" STOP USING THE ARROWS
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap <S-CR>    <CR><CR>end<Esc>-cc

let g:Powerline_symbols = "unicode"
