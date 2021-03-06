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
set nobackup
set nowb
set noswapfile
" set backup
" set backupdir=~/.tmp/swp
" set directory=~/.tmp/swp

" Colors and such
colorscheme vividchalk
set background=dark
set t_Co=256
let g:Powerline_symbols = "unicode"
set synmaxcol=1200
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

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

" Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gr :Gread<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Git lg<cr>
nmap <leader>gd :Gdiff<cr>
vmap <leader>gb :Gblame<cr>

set diffopt+=vertical

" RSpec
map <leader>rc :call RunCurrentSpecFile()<CR>
map <leader>rn :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" Other mappings
inoremap jk <Esc>

" Flip colorschemes
map <leader>bd :colorscheme vividchalk<cr>
map <leader>bl :colorscheme github<cr>

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

" Ctags
set tags=.tags,./.tags
nnoremap <C-[>. :CtrlPTag<cr>

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

" Toggle line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

map <leader>n :call NumberToggle()<cr>

" linting help
let g:syntastic_yaml_checkers = ['yamllint']

" DASH integration
command! DashDef silent !open -g dash://def:"<cword>"
map <leader>k :DashDef<CR>\|:redraw!<CR>
