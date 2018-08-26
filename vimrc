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
  let g:go_list_type = "quickfix"
  let g:go_fmt_autosave = 1
  let g:go_fmt_fail_silently = 1
  let g:go_fmt_command = "goimports"
  let g:go_auto_type_info = 1
  let g:go_echo_command_info = 1
  let g:go_gocode_autobuild = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  set updatetime=50
  Plug 'tpope/vim-fireplace'
  Plug 'rust-lang/rust.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'mattreduce/vim-mix'
  Plug 'vim-ruby/vim-ruby'

  " --- Look and feel ---
  Plug 'itchyny/lightline.vim'
		let g:lightline = {'colorscheme': 'PaperColor'}
    set laststatus=2
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'

  " --- Auto completion ---
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'scrooloose/nerdcommenter'

  " --- File navigation ---
  Plug 'tpope/vim-vinegar'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_launcher = "~/opt/dotfiles/scripts/fzf_launcher.sh %s"
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    nnoremap <silent> <C-p> :Files<CR>
    nnoremap <silent> <C-l> :Buffers<CR>
    nnoremap <silent> <C-g> :Ag<CR>
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

" Leader keys

" Q

"q Show how function is reached :GoCallstack
autocmd FileType go nmap <leader>q <Plug>(go-callstack)

" W

"w Alternwate window splits
nnoremap <leader>w <C-w>w
"W Only one active window nnoremap <Leader>W :only<CR>

" E

"e Generate error handling :GoIfErr
autocmd FileType go nmap <leader>e <Plug>(go-iferr)

" R

"r Rename :GoRename[!] [to]
autocmd FileType go nmap <leader>r <Plug>(go-rename)

" T

"t Test function :GoTestFunc[!] [expand]
autocmd FileType go nmap <leader>t <Plug>(go-test-func)
"T Test file :GoTest[!] [expand] autocmd FileType go nmap <leader>T <Plug>(go-test)

" Y

"y Keyify struct literals :GoKeyify
nnoremap <Leader>y :GoKeyify<CR>

" U

"u Fill struct with defaults :GoFillStruct
nnoremap <Leader>u :GoFillStruct<CR>

" I

"i List interfaces implemented :GoImplements
autocmd FileType go nmap <leader>i <Plug>(go-implements)
"I Stub interface methods :GoImpl [receiver] [interface]
nnoremap <Leader>I :GoImpl<CR>

" O

" P

"p c Possible callers of a function :GoCallers
autocmd FileType go nmap <leader>pc <Plug>(go-callers)
"p t Possible call targets for a type :GoCallees autocmd FileType go nmap <leader>pt <Plug>(go-callees)
"p v Possible vars of a pointer :GoPointsTo autocmd FileType go nmap <leader>pv <Plug>(go-pointsto)
"p e Possible error types of an error :GoWhicherrs
nnoremap <Leader>pe :GoWhicherrs<CR>
"p c Channel peers :GoChannelPeers autocmd FileType go nmap <leader>pp <Plug>(go-channelpeers)

" A

"a Alternate test/implementation :GoAlternate[!]
autocmd FileType go nmap <leader>a <Plug>(go-alternate-edit)

" S

"s Describe type or identifier :GoDescribe
autocmd FileType go nmap <leader>s <Plug>(go-describe)

" D

"d Show doc :GoDoc [word]
autocmd FileType go nmap <leader>d <Plug>(go-doc)
"D Browse doc :GoDocBrowser [word]
autocmd FileType go nmap <leader>D <Plug>(go-doc-browser)

" F

"f Show all functions and types in file :GoDecls [file]
nnoremap <Leader>f :GoDecls<CR>
"F Show all functions and types in directory :GoDeclsDir [dir]
nnoremap <Leader>F :GoDeclsDir<CR>

" G

"g Show definition jump stack :GoDefStack [number]
autocmd FileType go nmap <leader>g <Plug>(go-def-stack)
"G Clear definition jump stack :GoDefStackClear
autocmd FileType go nmap <leader>G <Plug>(go-def-stack-clear)

" H

"h Show all identifiers referring to the object :GoReferrers
autocmd FileType go nmap <leader>h <Plug>(go-referrers)
"H Toggle highlight same identifiers :GoSameIdsToggle
nnoremap <Leader>H :GoSameIdsToggle<CR>

" J

" K

" L

"l List buffers
nnoremap <leader>l :ls<CR>:b<space>
"L List files
nnoremap <Leader>L :Explore<CR>

" Z

" X

"w Close window split
nnoremap <leader>x <C-w>c

" C

"c Toggle coverage :GoCoverageToggle[!] [options]
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"C Browse coverage :GoCoverageBrowser[!] [options]
nnoremap <Leader>C :GoCoverageBrowser<CR>

" V

"v Show free variables in selection :GoFreevars
autocmd FileType go nmap <leader>v <Plug>(go-freevars)

" B

"b Build :GoBuild[!] [expand] :GoTestCompile[!] [expand]
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"B Run :GoRun[!] [expand]
autocmd FileType go nmap <leader>B <Plug>(go-run)

" N

" M

"m Meta linter :GoMetaLinter [path]
autocmd FileType go nmap <leader>M <Plug>(go-metalinter)

" Buffer navigation
nnoremap <leader><TAB> :b#<CR>
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
