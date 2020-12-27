" curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
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
set ttimeoutlen=10 " Fix slow O

" Switch to left pane map <C-t><down> :td<cr> " Bind ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
" map <C-R> :NERDTreeRefresh<CR>

" Fzf search for file
map <C-p> :FzfFiles<CR>

map <C-s> :!sh -xc './compile_text.sh'

map <C-h> hzz
map <C-j> jzz
map <C-k> kzz
map <C-l> lzz

map j gj
map k gk

" map <C-c> :!sh -xc '/home/matt/git/md/Notes/compile_tex.sh'

" Better pane toggling
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>

set splitright
set splitbelow

call plug#begin('~/.vim/plugged')
" Themes
Plug 'arzg/vim-colors-xcode'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'ntk148v/vim-horizon'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main' } 

" Status lines
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Language support
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-llvm'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ron-rs/ron.vim'
Plug 'tbastos/vim-lua'
Plug 'elixir-editors/vim-elixir'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-python/python-syntax'
Plug 'bfrg/vim-cpp-modern'

" Other
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'

call plug#end()

" Autosave for go and rust
let g:rustfmt_autosave = 1
let g:go_fmt_autosave = 1

" fzf config
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout=  { 'down': '~20%' }

" Configure airline
" let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'

" Configure status bar
set laststatus=2
set noshowmode
" let g:lightline = { 'colorscheme': 'seoul256' }
let g:lightline = { 'colorscheme': 'wombat' }

" Configure coc
let g:coc_disable_startup_warning = 1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Fix NERDTree annoyances
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Fix colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
let g:rehash256 = 1
set background=dark

let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material
colorscheme gruvbox

" Colorscheme
" colorscheme onedark
" colorscheme dracula
" colorscheme horizon
" colorscheme gruvbox

