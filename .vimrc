" curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on set tabstop=4 set expandtab
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

" Switch to left pane map <C-t><down> :td<cr> " Bind ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
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
Plug 'arzg/vim-colors-xcode'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'rakr/vim-one'

" Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'hashrocket/vim-macdown'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'ron-rs/ron.vim'
call plug#end()

" Autosave for go and rust
let g:rustfmt_autosave = 1
let g:go_fmt_autosave = 1

" execute macdown render on save
autocmd BufWritePost *.md exec :MacDownPreview

" fzf config
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout=  { 'down': '~20%' }

" Configure nord & airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Configure status bar
"set laststatus=2
" set noshowmode
" let g:lightline = {
"       \ 'colorscheme': 'onedark',
"       \ }

" configure one theme italics
let g:one_allow_italics = 1

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

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:rehash256 = 1

" colorscheme onedark
" colorscheme onedark " main theme

" set background=light
colorscheme one
