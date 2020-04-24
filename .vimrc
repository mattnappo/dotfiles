" curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
set tabstop=4
set backspace=indent,eol,start
set autoindent
set formatoptions+=r
set number
set hlsearch
set ruler
set encoding=utf-8

" Switch to right pane
map <C-t><up> :tu<cr>
" Switch to left pane
map <C-t><down> :td<cr>
" Bind ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
" Fzf search for file
map <C-p> :FzfFiles<CR>

" Better pane toggling
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>

set splitright
set splitbelow

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/arzg/vim-colors-xcode'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
call plug#end()

" Autosave for go and rust
let g:rustfmt_autosave = 1
let g:go_fmt_autosave = 1

" fzf config
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout=  { 'down': '~20%' }

" Configure nord & airline
let g:nord_bold = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Configure cocj
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

" Enable true 256-bit color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

augroup filetypedetect
  autocmd FileType go        setlocal noexpandtab  shiftwidth=4 tabstop=4
  autocmd FileType js        setlocal expandtab    shiftwidth=2 tabstop=2
  autocmd FileType haskell   setlocal expandtab    shiftwidth=4 tabstop=4
  autocmd FileType json      setlocal expandtab    shiftwidth=4 tabstop=4
  autocmd FileType python    setlocal expandtab    shiftwidth=4 tabstop=4

" colorscheme xcodedark
colorscheme nord

