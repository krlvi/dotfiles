" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

let mapleader = "\<Space>"

" Make sure you use single quotes
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'kien/ctrlp.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
  "nnoremap <silent> <leader>f :Files<CR>
  "nnoremap <silent> <leader>b :Buffers<CR>
  "nnoremap <silent> <leader>l :BLines<CR>
  "nnoremap <silent> <leader>L :Lines<CR>
  "nnoremap <silent> <leader>c :BCommits<CR>
  "nnoremap <silent> <leader>C :Commits<CR>
  "nnoremap <silent> <leader>h :History<CR>

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

" Buffer navigation
nnoremap <leader>l :ls<CR>:b<space>

" Directory setup
set directory=/tmp
set backupdir=/tmp

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

set t_Co=256

set guifont=Source\ Code\ Pro:h15

" Syntax highlighting and theme 
syntax enable
highlight LineNr ctermfg=blue
"set background=light
"colorscheme solarized
