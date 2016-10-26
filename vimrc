set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'AlessandroYorba/Alduin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'wesQ3/vim-windowswap'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'isRuslan/vim-es6'


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

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--noImplicitAny --jsx react'
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_tsc_args = '--noImplicitAny --jsx react --target ES5'

let g:syntastic_javascript_checkers = ['eslint']

let g:airline_powerline_fonts = 1

let mapleader=','

map <C-\> :NERDTreeToggle<CR>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

vmap <C-N> :MultipleCursorsFind<Space>

"General
set mouse=a
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set splitright
set splitbelow
set hidden
set nowrap
set backspace=indent,eol,start
set textwidth=0
set wrapmargin=0
set sidescroll=1

let g:alduin_Shout_Become_Ethereal = 1
colorscheme alduin

let g:airline_theme = 'luna'

syntax on

