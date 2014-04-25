" .vimrc file by Henrique Leal <hm.leal@hotmail.com>

" Vundle required config
" ======================


" be iMproved!
set nocompatible
filetype off


" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'


    " My Plugins here:
    Plugin 'gmarik/vundle'
    Plugin 'scrooloose/syntastic'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tomasr/molokai'
    Plugin 'gregsexton/MatchTag'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'SirVer/ultisnips'
    Plugin 'tpope/vim-markdown'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'ervandew/supertab'
    Plugin 'miripiruni/CSScomb-for-Vim.git'

call vundle#end()

" Enable syntax highlighting
filetype plugin indent on
syntax on


" Plugins Config
" ==============


" Setting for powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'


" Settings for syntastic Python
let g:syntastic_python_checkers=['pep8', 'pyflakes']


" Settings for syntastic PHP
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--report=csv --standard=CakePHP'


" Settings for NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" Jedi-python
let g:jedi#related_names_command="<leader>z"
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Supertab
let g:SuperTabDefaultCompletionType = "context"


" General options
" ===============


" Auto-load .vimrc file
autocmd! bufwritepost .vimrc source %


" Rebind <leader> key
let mapleader = ","


" Remove menu e toolbar 
" set guioptions-=m
set guioptions-=T


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Basic Setup and preferences
" ===========================


" Better Copy & Paste
set clipboard=unnamedplus


" Directories for swp files
set nobackup
set nowritebackup
set noswapfile


" Add some line space for easy reading
set linespace=4


" Showing line numbers and length
set number
set cul
set colorcolumn=80


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile


" Color Scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
" color wombat256mod
colorscheme molokai


" Show hide characteres
set list
set listchars=tab:▸\ ,eol:¬


" Shortcuts
" =========


" Edit vim-file
nmap <leader>v :tabedit $MYVIMRC<CR>


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Move lines up and down
noremap <C-S-j> :m+<CR>
noremap <C-S-k> :m-2<CR>
inoremap <C-S-j> <Esc>:m+<CR>
inoremap <C-S-k> <Esc>:m-2<CR>
vnoremap <C-S-j> :m'>+<CR>gv
vnoremap <C-S-k> :m-2<CR>gv
