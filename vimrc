call pathogen#infect()
call pathogen#helptags()

" General stuffs
set history=100

filetype plugin on
filetype plugin indent on

let mapleader = ","

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" I rarely use backups, but just in case
set backup
set backupdir=~/.tmp/swp
set directory=~/.tmp/swp

" Colors and such
colorscheme vividchalk
set background=dark
set t_Co=256

" Interface
syntax enable
filetype plugin indent on

set hid
set nocompatible
set backspace=indent,eol,start
set autoindent
set laststatus=2
set winwidth=81

set showcmd
set incsearch
set hlsearch

" Visuals for proper editing
set colorcolumn=80
set ruler
set number

" Tabbing
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" STOP USING THE ARROWS
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Windows and Buffers
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

imap <S-CR>    <CR><CR>end<Esc>-cc

let g:Powerline_symbols = "unicode"

" Ctags
set tags=./.git/tags
