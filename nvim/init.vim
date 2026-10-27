syntax on
syntax enable

set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set noautoindent
set formatoptions+=r
set hlsearch
set incsearch
set ruler
set encoding=utf-8
set virtualedit=block
set number
set relativenumber
set ttimeoutlen=10
set mouse=a
filetype plugin indent on
set colorcolumn=

" Switch to left pane map <C-t><down> :td<cr> " Bind ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<cr>

" Fzf search for file
map <C-p> :FzfFiles<CR>

" better pane movement
map <C-h> hzz
map <C-j> jzz
map <C-k> kzz
map <C-l> lzz
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>

set splitright
set splitbelow

" logical line moving
map j gj
map k gk

map <C-w>m :MaximizerToggle<cr>

" Remove highlighting shortcut
map <C-a> :NERDTreeRefresh<CR>\|:noh<CR>

call plug#begin('~/.vim/plugged')
" Themes
Plug 'Mofiqul/vscode.nvim'
Plug 'sainnhe/gruvbox-material'

" Language support
Plug 'rhysd/vim-llvm'
Plug 'rust-lang/rust.vim'

" Other
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'
Plug 'preservim/nerdcommenter'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()

" Autosave for go and rust
let g:rustfmt_autosave = 1
let g:ale_linters = {'rust': ['analyzer'], 'go': ['gopls']}

" Enable fixing files on save
" ale_fix_on_save only controls *when* fixers run; g:ale_fixers lists *what*
" runs. Linters never modify the buffer, so Go needs a fixer listed here.
" goimports is gofmt plus import-block maintenance.
let g:ale_fix_on_save = 1
let g:ale_fixers = {'go': ['goimports']}

" fzf config
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout=  { 'down': '~20%' }

" ALE config
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

" Configure fzf to respect .gitignore
" Uses fd if available, falls back to git ls-files, then find
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files'
else
  let $FZF_DEFAULT_COMMAND = 'git ls-files --cached --exclude-standard 2>/dev/null || find . -type f'
endif

" ripgrep integration without buffer jumps or output noise
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

" No output, no cursor jumps; accept spaces without quoting
command! -nargs=+ Grep silent! keepjumps grep <q-args>

" open quickfix as a vertical split on the left, only if results exist
" autocmd QuickFixCmdPost grep topleft vert cwindow 40 " doesn't work yet

" keybinding (Ctrl+F) to invoke grep
nnoremap <C-f> :Grep 

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let NERDTreeShowHidden = 1
let g:NERDTreeHijackNetrw = 0

" Fix NERDTree annoyances
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


function! ToggleMinimalMode()
  if &number || &relativenumber || &mouse != ""
    set nonumber norelativenumber mouse=
    :ALEDisable
    echo "copy mode: OFF"
  else
    set number relativenumber mouse=a
    :ALEEnable
    echo "copy mode: ON"
  endif
endfunction

nnoremap <leader>z :call ToggleMinimalMode()<CR>


" colorscheme gruvbox-material
" colorscheme vim

