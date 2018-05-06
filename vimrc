" leader
let mapleader = ' '
let g:mapleader = ' '

" enable syntatic color scheme
syntax on

" lines of history that vim will remember
set history=2000

" filetype
filetype on
" enable filetype plugins
filetype plugin on
filetype indent on

" base
" don't bother with vi compatibility
set nocompatible
" reload files when changed on disk, i.e. via `git checkout`
set autoread
set shortmess=atI

" for regular expressions turn magic on
set magic
" change the terminal's title
set title
" do not keep a backup file
set nobackup
" turn off visual bell
set novisualbell
" don't beep
set noerrorbells
" turn off error beep/flash
set visualbell t_vb=
set t_vb=
set tm=500

" hightlight column and row 
set cursorcolumn
set cursorline


" movement
set scrolloff=9


" show
" show the current row and column
set ruler
" show line numbers
set number
" display a long line in one line
set nowrap
" display incomplete commands
set showcmd
" display current modes
set showmode
" jump to matches when entering parentheses
set showmatch
" tenths of a second to show the matching parenthesis
set matchtime=2

" search
" highlight searches
set hlsearch
" search as characters are entered
set incsearch
" ignore case when searching
set ignorecase
" no ignorecase if Uppercase char present
set smartcase

" tab
" expand tabs to spaces
set expandtab
set smarttab
set shiftround

" indent
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
" insert mode tab and backspace use 4 spaces
set softtabstop=4

" fold
set foldenable
set foldmethod=indent
set foldlevel=99
" Use space open/closes folds
nnoremap <space> za

" disable auto_comment while pasting
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" paste mode setting
" automatically enter paste mode when usring ctrl+v
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" select & complete
set selection=inclusive
set selectmode=mouse,key

set completeopt=longest,menu
" show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class

" make that backspace key work the way it should
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" enable mouse
set mouse=a
set mousehide
" scroll in vim instead of terminal
set mouse=nicr


" =================================== theme ===================================

colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" Overwirte molokai background
hi Normal ctermbg=none
hi NonText ctermbg=none

" ================================ specific file type =========================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType vue set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " .sh
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
    endif

    " python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" ============================ key map ============================

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>

" jk is escape
inoremap jk <esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

" select all
map <Leader>sa ggVG"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" switch # *
" nnoremap # *
" nnoremap * #

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" use W to save as sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" ============================ plugin ============================

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
" Plugin 'townk/vim-autoclose'
Plugin 'yggdroot/indentline'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'JavaScript-Indent'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'me-vlad/python-syntax.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'git@github.com:python-mode/python-mode.git'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'posva/vim-vue'
Plugin 'git@github.com:fatih/vim-go.git'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Map NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" SimpyFlod setting
let g:SimpyFlod_docstring_preview=1

" show docstrings for folded code
let g:SimpylFold_docstring_preview=1


" syntastic recommend setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set laststatus=2

" check syntax when opening file
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files = ['\.dtx', '\.tex']
let g:syntastic_python_checkers = ['pylint']

" let python_highlight_all=1
let g:syntastic_javascript_checkers = ['eslint']

" set airline theme
let g:airline_theme='light'

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

" the NERD commenter setting

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" YouCompleteMe setting
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_python_binary_path = '/usr/local/opt/python/libexec/bin/python'
" Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" pymode setting
" let g:pymode_python = 'python3'
let g:pymode_virtualenv=1 " Auto fix vim python paths if virtualenv enabled

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-y>"
let g:UltiSnipsJumpBackwardTrigger="<C-m>"

" vue highlight setting
autocmd BufNewFile,BufRead *.vue set ft=vue

" stop hyper from displying some random utf-8 code
set t_RV=
" python_mode setting
let g:pymode_python = 'python3'
