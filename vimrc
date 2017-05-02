" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

let mapleader = "\<Space>"

" Make sure you use single quotes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  nnoremap <silent> <leader>t :NERDTreeToggle<CR>
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
Plug 'ap/vim-buftabline'
  :hi TabLineFill ctermfg=LightGray
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap <silent> <leader>f :Files<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
  nnoremap <silent> <leader>l :BLines<CR>
  nnoremap <silent> <leader>L :Lines<CR>
  nnoremap <silent> <leader>c :BCommits<CR>
  nnoremap <silent> <leader>C :Commits<CR>
  nnoremap <silent> <leader>h :History<CR>

" Initialize plugin system
call plug#end()

set nocompatible

" Improve performance
set lazyredraw
set ttyfast
set ttimeoutlen=10
" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" Extra security plus im not using modelines
set modelines=0

" Tabs the way i want them
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Some more text settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode 
set showcmd

" Hidden unsaved buffers
set hidden
" Save file on change of focus
au FocusLost * :wa

" Tab completion of commands
set wildmenu
set wildmode=full
" Dont play sounds
set visualbell
" Highlight current line
"set cursorline
set ruler
set backspace=indent,eol,start
" Constant status line
set laststatus=2
" Relative line lumbers
set relativenumber
set undofile

" Search replace customizations
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set splitbelow
set splitright

set pastetoggle=<F2>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

set t_Co=256

set guifont=Source\ Code\ Pro:h15

" Syntax highlighting and theme 
syntax enable
highlight LineNr ctermfg=blue
"set background=light
"colorscheme solarized
