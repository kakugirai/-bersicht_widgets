syntax enable

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme my_molokai

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4

set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar

set cursorline          " highlight current line
set cursorcolumn

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set ignorecase
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
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

let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
set shortmess=atI

" enable mouse
set mouse=a
set mousehide

set title

" disable beep and flash
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set magic

" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

set ruler

set showcmd

set showmode

set scrolloff=7
set nowrap

" set smartindent
" set autoindent

set encoding=utf-8

"split navigations
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
Plugin 'pangloss/vim-javascript'
Plugin 'townk/vim-autoclose'
Plugin 'yggdroot/indentline'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'JavaScript-Indent'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'me-vlad/python-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
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

"syntastic
" let python_highlight_all=1
