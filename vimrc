call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set backup
set backupdir=~/.tmp/swp
set directory=~/.tmp/swp

syntax on
filetype plugin indent on
filetype indent on
filetype plugin on

set nocompatible
set backspace=indent,eol,start
set autoindent
set history=50
set ruler
set showcmd
set incsearch

set shiftwidth=2
set softtabstop=2

set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)

" STOP USING THE ARROWS
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap <S-CR>    <CR><CR>end<Esc>-cc
