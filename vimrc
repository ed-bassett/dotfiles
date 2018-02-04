:autocmd!

set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"set balloondelay=100

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'AlessandroYorba/Alduin'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'wincent/command-t'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'wesQ3/vim-windowswap'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'isRuslan/vim-es6'
Plug 'slim-template/vim-slim'
Plug 'derekwyatt/vim-scala'
Plug 'racer-rust/vim-racer'
Plug 'ed-bassett/vim-embiggen'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'autozimu/LanguageClient-neovim',
"Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-apple-darwin'}
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'install.sh',
    "\ }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" TypeScript
Plug 'Shougo/vimproc.vim'
Plug 'Quramy/tsuquyomi'

call plug#end()

"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--noImplicitAny --jsx react'
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_tsc_args = '--noImplicitAny --jsx react --target ES5'

let g:syntastic_javascript_checkers = ['eslint']

"rust
let g:rust_recommended_style = 0

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

"if has("gui_running")
  "" balloon info for symbol under cursor
  "set ballooneval
  "autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
"endif

"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = '--jsx react --noImplicitAny'
"let g:syntastic_typescript_tsc_args = 'typings/tsd.d.ts --jsx react --noImplicitAny'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

"let g:syntastic_rust_checkers = ['rustc']

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:airline_powerline_fonts = 1

let mapleader=','

map <C-\> :NERDTreeToggle<CR>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

vmap <C-N> :MultipleCursorsFind<Space>

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']






"if executable('rls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rls',
"        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"        \ 'whitelist': ['rust'],
"        \ })
"endif
"
"
"
"let g:lsp_document_symbols_ui = 'balloon-expr'


" a basic set up for LanguageClient-Neovim

" << LSP >> {{{

"let g:LanguageClient_autoStart = 1
nnoremap <leader>lcs :LanguageClientStart<CR>

" if you want it to turn on automatically
let g:LanguageClient_autoStart = 1

"let g:LanguageClient_serverCommands = {
   ""\ 'python': ['pyls'],
   ""\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
   ""\ 'javascript': ['javascript-typescript-stdio'],
   ""\ 'go': ['go-langserver'] }

let g:LanguageClient_serverCommands = {'rust': ['rustup', 'run', 'nightly', 'rls'] }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}


"set balloonexpr=LanguageClient_textDocument_hover()




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

set gfn=Sauce\ Code\ Powerline\ Semibold:h11

"let g:alduin_Shout_Become_Ethereal = 1
colorscheme slate

let g:airline_theme = 'luna'

syntax on

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions+=c

"if has("gui_running")
  "set fuoptions=maxvert,maxhorz
  "au GUIEnter * set fullscreen
"endif

"Ensure airline shows in single window
set laststatus=2

nnoremap <silent> + :noautocmd call Resize(1)<CR>
nnoremap <silent> - :noautocmd call Resize(-1)<CR>
map <silent> <C-W>= :call WinEqualSize()<CR>
autocmd VimResized * call ResetResize()

"set noequalalways

"set beval
