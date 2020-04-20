" curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
set tabstop=4
set backspace=indent,eol,start
set autoindent
set number
set hlsearch
set ruler
set encoding=utf-8

" Switch to right pane
map <C-t><up> :tr<cr>
" Switch to left pane
map <C-t><down> :tl<cr>
" Bind ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>

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

map <C-p> :FzfFiles<CR>

" configure nord theme
let g:nord_bold = 1
let g:airline_powerline_fonts = 1

" disable Airline (temporarily)
"let g:airline_disable_statusline = 1

" enable true 256-bit color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

"colorscheme xcodedark
colorscheme nord

