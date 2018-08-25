  "vim-gitR KEY =====
  let mapleader = "\<Space>"
  " ===== PLUGINS =====
  call plug#begin('~/.vim/plugged')

  " --- Git ---
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'airblade/vim-gitgutter'

  " --- Language specific ---
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  let g:go_fmt_autosave = 1
  let g:go_fmt_fail_silently = 1
  let g:go_fmt_command = "goimports"
  let g:go_auto_type_info = 1
  let g:go_echo_command_info = 1
  let g:go_gocode_autobuild = 1
  " let g:go_auto_sameids = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  set updatetime=50
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-fireplace'
  Plug 'rust-lang/rust.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'mattreduce/vim-mix'
  Plug 'vim-ruby/vim-ruby'

  " --- Look and feel ---
  Plug 'Yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'
		let g:lightline = {'colorscheme': 'PaperColor'}
    set laststatus=2
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'

  " --- Static code analysis ---
  Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
  Plug 'neomake/neomake'
    autocmd! BufWritePost *.ex Neomake credo

  " --- Auto completion ---
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'zchee/deoplete-go', { 'do': 'make'} 
  "let g:deoplete#auto_complete_delay = 10  " Default is 50
  "let g:deoplete#auto_refresh_delay = 10  " Default is 500
  "let g:deoplete#enable_at_startup = 1
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/tpope-vim-abolish'

  " --- File navigation ---
  Plug 'ctrlpvim/ctrlp.vim'
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

  " --- Other ---
  Plug 'tpope/vim-speeddating'
  Plug 'jceb/vim-orgmode'

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
  set shell=zsh
  set autowrite

  " wrap long lines in quickfix
  augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
  augroup END

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
  set wildmode=longest,list,full

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
set background=light
colorscheme PaperColor 
" Set font size based on screen size.
if has("gui_running")
  if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
    set guifont=Input\ Mono:h23
  else
    "set guifont=Source\ Code\ Pro:h14
    set guifont=SF\ Mono:h14
    "set guifont=Input\ Mono:h14
  endif
endif

" ===== Key bindings =====
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>n  <Plug>(go-rename)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" Buffer navigation
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <Leader>L :Explore<CR>
nnoremap <leader><TAB> :b#<CR>
nnoremap <leader>w <C-w>w
nnoremap <Leader>W :only<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 1
nnoremap <CR> :nohlsearch<CR><CR>
" Neovim bindings
if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif
" Other
set pastetoggle=<F2>
map <F1> <Esc>
imap <F1> <Esc>
