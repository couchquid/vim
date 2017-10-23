set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'Valloric/MatchTagAlways'
Plug 'myusuf3/numbers.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ZoomWin'
Plug 'maralla/completor.vim'
Plug 'fatih/vim-go'

Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tomasr/molokai'
Plug 'jacoborus/tender.vim'
Plug 'airblade/vim-gitgutter'

Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'hdima/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'peterhoeg/vim-qml'

call plug#end()

"if(has("termguicolors"))
"    set termguicolors
"endif

filetype plugin indent on           " Automatically detect filetypes
syntax on                           " Turn on syntax hightlighting
"syntax enable
set splitbelow                      " Split window below current window
set splitright                      " Split window to the right of current window
set history=50                      " Keep last 50 commands in history
set timeoutlen=500                  " Less timeout after pressing leader key
set scrolloff=35
set backspace+=start,eol,indent

autocmd BufEnter * :syntax sync fromstart " Syntax highlighting from start
set gcr=a:blinkon0                  " Disable blinking cursor
set fileformats=unix,dos,mac        " Set fileformatA
set hidden                          " Switch between buffers without saving
set encoding=utf-8                  " Use utf-8 encoding

" Backup
set nobackup
au BufWinLeave * silent! mkview     " Vim save view state (folds, cursor, etc)
au BufWinEnter * silent! mkview     " Vim load view state (folds, cursor, etc)
set noswapfile

set background=dark
colorscheme tender

" Theme settings
"hi cursorline cterm=NONE ctermbg=236
hi cursorline cterm=NONE
set cursorline
set guifont=Inconsolata\ 10
set guioptions-=LR

set number                          " Linenumbers
set linespace=3                    " Slightly higher line height
set showmatch                       " Show matching parenthesis/brackets
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight whitespace
set showtabline=0                   " Never show the tabline
set laststatus=2                    " Always show the statusline

" Search
set incsearch                       " Find as you type
set hlsearch                        " Hilight search terms
set ignorecase                      " Case-insensitive searching
set smartcase                       " But case-sensitive if expression have a capital letter

" Formatting
set nowrap                          " Don't wrap long lines
set shiftwidth=4                    " Indents are 4 spaces long
set tabstop=4                       " How many spaces a tab is
set softtabstop=4                   " Backspace delete indents
set expandtab                       " Use spaces for indentation instead of tabs
set pastetoggle=<F12>               " Try and make indentation better on pastes

set ttimeoutlen=50

" Javascript indentation
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2

" HTML indentation
autocmd FileType html,xhtml,xml,jinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Use same settings for JSON as Javascript
au BufNewFile,BufRead *.json set ft=javascript

" Key remaps
let mapleader = ','                     " Map leader to ,

" Formatting using middlemouse paste
map <MouseMiddle> <ESC>"*p

" Split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s

" Turn of search highlighting
nmap <silent> <leader>m :nohlsearch<CR>

" Plugin bindings
nmap <leader>a <ESC>:Ack!
map <leader>e :NERDTreeToggle<CR>
nnoremap <leader>g :GundoToggle<CR>
map <leader>zw :ZoomWin<CR>
map <leader>t :CtrlP<CR>

" Switch Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" OmniCompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python set omnifunc=pythoncomplete#Complete

" CtrlP
set wildignore+=*/node_modules/*,*.pyc,*/.git/*,.gitignore,*/build/*  " Ignore stuff
let g:ctrlp_working_path_mode = 2

" DelimitMate
"let delimitMate_expand_cr=1

" NerdTree
let NERDTreeShowBookmarks=0         " Dont show bookmarks
let NERDTreeIgnore=['\.pyc', '.git', '.db']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeKeepTreeInNewTab=1

" Numbers.vim
nnoremap <leader>n :NumbersToggle<CR>

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:lightline = { 'colorscheme': 'tender' }
"let g:lightline.colorscheme = 'Molokai'

" Ale
let g:ale_sign_columns_always = 1

let g:completor_gocode_binary = '/home/couchquid/go/bin/gocode'
let g:completor_clang_binary = '/usr/bin/clang'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
