set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'tommcdo/vim-lion'
Plug 'wellle/targets.vim'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'dense-analysis/ale'

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'

Plug 'natebosch/vim-lsc'
Plug 'ajh17/VimCompletesMe'

Plug 'hail2u/vim-css3-syntax'
Plug 'hdima/python-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'

call plug#end()

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
silent! colorscheme tender

" Theme settings
hi cursorline cterm=NONE
set cursorline
set guifont=Hack\ 11
set guioptions-=LR

set number                          " Linenumbers
set linespace=3                     " Slightly higher line height
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

"" Javascript indentation
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2

" HTML indentation
autocmd FileType html,xhtml,xml,jinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Use same settings for JSON as Javascript
au BufNewFile,BufRead *.json set ft=javascript

" Key remaps
let mapleader = ','                 " Map leader to ,

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

" Switch Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" OmniCompletion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType python set omnifunc=pythoncomplete#Complete

"set completeopt=menu,menuone,preview,noinsert,noselect
set completeopt=menu,menuone,noinsert,noselect

" Suppress 'pattern not found' etc messages
set shortmess+=c

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" fzf-vim
let g:fzf_buffers_jump = 1

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules,target}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)    
nmap <Leader>f :Find 

" DelimitMate
let delimitMate_expand_cr=1

" NerdTree
let NERDTreeShowBookmarks     = 0 " Dont show bookmarks
let NERDTreeIgnore            = ['\.pyc', '.git', '.db']
let NERDTreeChDirMode         = 0
let NERDTreeQuitOnOpen        = 1
let NERDTreeKeepTreeInNewTabi = 1

" Numbers.vim
nnoremap <leader>n :NumbersToggle<CR>

" Spellchecking
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us

let g:lsc_server_commands = {
    \ 'javascript': {
    \   'command': 'typescript-language-server --stdio',
    \   'log_level': -1,
    \   'suppress_stderr': v:true,
    \ },
    \ 'rust': {
    \ 'command': 'rls',
    \ 'log_level': -1,
    \ 'suppress_stderr': v:true,
    \ },
    \}

let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'FindReferences' : 'gr',
    \ 'Rename': 'gR',
    \ 'ShowHover': 'K',
    \ 'Completion': 'omnifunc',
    \}

let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

" ALE
let g:ale_fixers = {
    \ 'css': ['prettier'],
    \ 'javascript': ['prettier-standard'],
    \ 'json': ['prettier'],
    \ 'yml': ['prettier'],
    \ 'rust': ['rustfmt'],
    \ }

let g:ale_linters = {
    \ 'css': ['csslint'],
    \ 'javascript': ['standard'],
    \ 'json': ['jsonlint'],
    \ 'yaml': ['yamllint'],
    \ 'rust': ['rls'],
    \ }

let g:ale_linters_explicit    = 1
let g:ale_open_list           = 1
let g:ale_sign_columns_always = 1
let g:ale_sign_error          = '✖'
let g:ale_sign_warning        = '⚠'

" Lightline

let g:lightline = {
    \ 'colorscheme': 'tender',
    \ 'active' : {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \   ,
    \   'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype'] ]
    \   },
    \   'component_function': {
    \       'gitbranch': 'fugitive#head',
    \   }
    \ }


let g:lightline#ale#indicator_checking = '◌'
let g:lightline#ale#indicator_ok       = '✓'

"let g:coc_status_error_sign = '✘'
"let g:coc_status_warning_sign = '⚠'

set updatetime=300
set signcolumn=yes

" vim-lion
let g:lion_squeeze_spaces = 1
