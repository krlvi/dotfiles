" ===== LEADER KEY =====
let mapleader = "\<Space>"
" ===== PLUGINS =====
call plug#begin('~/.vim/plugged')

" --- Git ---
Plug 'tpope/vim-fugitive'

" --- Language specific ---
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
  nnoremap <leader>r :Rake<CR>

" --- Look and feel ---
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
  set laststatus=2

" --- Static code analysis ---
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  nnoremap <leader>s :SyntasticCheck rubocop<CR>

" --- Auto completion ---
Plug 'ajh17/VimCompletesMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdcommenter'

" --- File navigation ---
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" ===== SENSIBLE DEFAULTS =====
set nocompatible
set modelines=0
set visualbell
set directory=/tmp
set backupdir=/tmp
set backspace=indent,eol,start
set hidden
set encoding=utf-8
set showmode 
set showcmd
set splitbelow
set splitright

" ===== PERFORMANCE IMPROVEMENTS =====
set lazyredraw
set ttyfast
set timeoutlen=1000 ttimeoutlen=0

" ==== INDENTATION AND TABS =====
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" ===== WILD MODE =====
set wildmenu
set wildmode=longest:full,full

" Save all files on losing focus
au FocusLost * :wa
autocmd BufLeave,FocusLost * silent! wall

" ===== SEARCH AND REPLACE =====
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" ===== Look and feel =====
set t_Co=256
set number
set cursorline
set ruler
set scrolloff=3
highlight LineNr ctermfg=gray
"set background=light
syntax enable
set guifont=Source\ Code\ Pro:h14

" ===== Key bindings =====
" Buffer navigation
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader><TAB> :b#<CR>
" Location list navigation
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>x :lclose<CR>
" Other
set pastetoggle=<F2>
