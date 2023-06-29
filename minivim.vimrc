" curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set noautoindent
set formatoptions+=r
set number
set hlsearch
set incsearch
set ruler
set encoding=utf-8
set virtualedit=block
set relativenumber
set splitright
set splitbelow
let mapleader = ","

map <C-n> :NERDTreeToggle<cr> " Bind ctrl-n to toggle NERDTree
map <C-p> :FzfFiles<CR> " Fzf search for file
map <C-t> :tabnew<cr>
map <C-s> :split<cr>

noremap <C-a> :noh \| :NERDTreeRefreshRoot<cr>
noremap <C-m> :MaximizerToggle<cr>

" Better pane toggling
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>

call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'

Plug 'pulkomandy/c.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'szw/vim-maximizer'

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" fzf config
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout=  { 'down': '~20%' }

" Fix NERDTree annoyances
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Put swapfiles in one separate location
set directory^=$HOME/.vim/swap/

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

" fix italics (might not be needed)
"set t_ZH=[2m
"set t_ZR=[23m

" Theming
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox-material
