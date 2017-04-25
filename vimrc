" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Done with Vundle

" Improve performance
set lazyredraw
set ttyfast
 
" For extra security plus im not using modelines
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

" Syntax highlighting and theme 
syntax enable
highlight LineNr ctermfg=blue
"set background=light
"colorscheme solarized
