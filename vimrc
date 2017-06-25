" ===== LEADER KEY =====
let mapleader = "\<Space>"
" ===== PLUGINS =====
call plug#begin('~/.vim/plugged') " --- Git ---
Plug 'tpope/vim-fugitive'

" --- Language specific ---
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mattreduce/vim-mix'
  nnoremap <leader>c :Mcompile<CR>
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
  let g:rails_ctags_arguments = ['$(bundle list --paths)']
  nnoremap <leader>r :Rake<CR>
  nnoremap t <C-]>

" --- Look and feel ---
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
  set laststatus=2
Plug 'morhetz/gruvbox'

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
Plug 'neomake/neomake'
  autocmd! BufWritePost * Neomake

" --- Auto completion ---
Plug 'ajh17/VimCompletesMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdcommenter'

" --- File navigation ---
Plug 'kien/ctrlp.vim'
  nnoremap <silent> <leader>f :CtrlP<CR>
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_launcher = "~/opt/dotfiles/scripts/fzf_launcher.sh %s"
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  "nnoremap <silent> <leader>f :Files<CR>
  "nnoremap <silent> <leader>b :Buffers<CR>
  "nnoremap <silent> <leader>l :BLines<CR>
  "nnoremap <silent> <leader>L :Lines<CR>
  "nnoremap <silent> <leader>c :BCommits<CR>
  "nnoremap <silent> <leader>C :Commits<CR>
  "nnoremap <silent> <leader>h :History<CR>
Plug 'wojtekmach/vim-rename'

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
set cc=80

" ===== WILD MODE =====
set wildmenu
set wildmode=longest:full,full

" Save all files on losing focus
au FocusLost * :wa
autocmd BufLeave,FocusLost * silent! wall
autocmd FileType c,cpp,java,php,rb,ex,exs,rbs,rake autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd BufWritePre *.rb %s/\s\+$//e

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
"set cursorline
set ruler
set scrolloff=3
highlight LineNr ctermfg=gray
syntax enable
highlight ColorColumn ctermbg=7
"set termguicolors
set background=dark
colorscheme gruvbox 
" Set font size based on screen size.
if has("gui_running")
  if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
    set guifont=Input\ Mono:h23
  else
    "set guifont=Source\ Code\ Pro:h14
    set guifont=Input\ Mono:h14
  endif
endif

" ===== Key bindings =====
" Buffer navigation
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader><TAB> :b#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" Location list navigation
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>x :lclose<CR>
nnoremap <leader>w <C-w>w
nnoremap <CR> :nohlsearch<CR><CR>
" Neovim bindings
if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif
" Other
set pastetoggle=<F2>
