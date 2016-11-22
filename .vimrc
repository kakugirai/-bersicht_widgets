" Change <leader> key
let mapleader = ','
let g:mapleader = ','

" Enable syntatic color scheme
syntax enable

" Set default color scheme to molokai
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Overwirte molokai background
hi Normal ctermbg=none
hi NonText ctermbg=none

" Set history capacity
set history=2000

" Check file type
filetype on
" Autoindent by checking file type
filetype indent on
" Allow plugin
filetype plugin on
" Open auto-complete
filetype plugin indent on

" Auto read file
set autoread

" Hide Uganda children
set shortmess=atI

" Show the origin file while exiting vim
" set t_ti= t_te=

" Change the terminal's title
set title

" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
set shiftwidth=4

" tabs are spaces
set expandtab 
" show line numbers
set number
" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" highlight current column
set cursorcolumn

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch
" Set case insensitive while searching
set ignorecase

" Highlight matches
set hlsearch

" Enable folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10 

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Use space open/closes folds
nnoremap <space> za

" Fold based on indent level
set foldmethod=indent

nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>
set shortmess=atI

" enable mouse
set mouse=a
set mousehide
" scroll in vim instead of terminal
set mouse=nicr

" disable beep and flash
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" enable regular expression while searching
set magic

set backspace=2
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" set a ruler for maxinum 80 words in a line
set ruler

" show the command that had been typed
set showcmd

" show command mode (Normal/Visual/Insert)
" set showmode

set scrolloff=9

" display a long line in one line
set nowrap
" wrap a long line to severals= lines
" set wrap


set encoding=utf-8

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tpope/vim-fugitive'
" Plugin 'pangloss/vim-javascript'
Plugin 'townk/vim-autoclose'
" Plugin 'yggdroot/indentline'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'JavaScript-Indent'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'me-vlad/python-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/youcompleteme'
" Plugin 'tpope/vim-surround'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'klen/python-mode'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
map <C-n> :NERDTreeToggle<CR>

" set rtp+=$HOMEanaconda/lib/python2.7/site-packages/powerline/bindings/vim
" set laststatus=2
" set t_Co=256

" syntastic recommend setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set laststatus=2

" SimpyFlod setting
let g:SimpyFlod_docstring_preview=1

" syntastic
let g:syntastic_ignore_files = ['\.py$', '\.dtx', '\.tex']
" let python_highlight_all=1

" set airline theme
let g:airline_theme='simple'

" Ctrlp setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its
" local working directory according to this variable:
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: 
"       .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is
"       not a direct ancestor of the directory of the current file
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
