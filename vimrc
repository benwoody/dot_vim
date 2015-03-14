call pathogen#infect()
call pathogen#helptags()

" General stuffs
set history=100

filetype on
filetype plugin on
filetype indent on

" Leader mappings
let mapleader = "\<Space>"

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Backups
set backup
set backupdir=~/.tmp/swp
set directory=~/.tmp/swp

" Colors and such
colorscheme vividchalk
set background=dark
set t_Co=256
let g:Powerline_symbols = "unicode"

" Tabbing
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

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

" Mappings
inoremap jk <Esc>

" STOP USING THE ARROWS
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

" Windows and Buffers
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

imap <S-CR>    <CR><CR>end<Esc>-cc

" Ctags
set tags=tags,./tags

" Whitespace hacks                                                              
function! <SID>StripTrailingWhitespaces()                                       
  let _s=@/                                                                     
  let l = line(".")                                                             
  let c = col(".")                                                              
  %s/\s\+$//e                                                                   
  let @/=_s                                                                     
  call cursor(l, c)                                                             
endfunction                                                                     
                                                                                
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Project specific
let g:rspec_command = 'call Send_to_Tmux("rug_spec {spec}\n")'

" ctrp-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']
set wildignore+=*/public/**
set wildignore+=*/vendor/**
set wildignore+=*/log/**
set wildignore+=*/temp/**


" git things
autocmd Filetype gitcommit setlocal spell textwidth=72
