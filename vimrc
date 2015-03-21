call pathogen#infect()
call pathogen#helptags()

" Interface
syntax on
filetype plugin indent on
set autoindent

set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set clipboard=unnamed
set hid
set nocompatible
set backspace=indent,eol,start
set laststatus=2
set winwidth=80
set history=1000
set showcmd
set incsearch
set hlsearch
set autoread

" Backups
set backup
set backupdir=~/.tmp/swp
set directory=~/.tmp/swp

" Colors and such
colorscheme vividchalk
set background=dark
set t_Co=256
let g:Powerline_symbols = "unicode"
set synmaxcol=1200

set colorcolumn=80
set ruler
set number

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

" Leader mappings
let mapleader = "\<Space>"

nmap <leader>w :w<cr>
nmap <leader>wq :wq<cr>

" Geeknote
noremap <leader>e :Geeknote<cr>

" Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Git lg<cr>
nmap <leader>gd :Gdiff<cr>
vmap <leader>gb :Gblame<cr>

" RSpec
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Other mappings
inoremap jk <Esc>

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

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']
set wildignore+=*/public/**
set wildignore+=*/vendor/**
set wildignore+=*/log/**
set wildignore+=*/temp/**

" git things
autocmd Filetype gitcommit setlocal spell textwidth=72
