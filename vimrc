call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

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
