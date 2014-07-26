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
    Plugin 'mattn/emmet-vim'

call vundle#end()

" Enable syntax highlighting
filetype plugin indent on


""
"" Basic setup {{{
""

syntax enable                   " Turn on syntax highlighting allowing local
set number                      " show line numbers
set ruler                       " show line and column number
                                " overrides
set encoding=utf-8              " set default encoding to UTF-8
set listchars=""                " Reset the listchars
set listchars=tab:\ \           " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.          " show trailing spaces as dots
set listchars+=extends:>        " The character to show in the last column when wrap is
                                " off and the line continues beyond the right of the screen
set listchars+=precedes:<       " The character to show in the last column when wrap is
                                " off and the line continues beyond the left of the screen
set clipboard=unnamedplus       " Better Copy & Paste
set nobackup                    " disable backup before overwriting a file
set nowritebackup               " disable backup before overwriting a file
set noswapfile                  " disable swap file
set cul                         " Highlight the screen line of the cursor
set linespace=4                 " Add some line space for easy reading
set colorcolumn=80              " Useful to align text
set expandtab                   " use spaces, not tabs
set list                        " show invisible characters
set tabstop=4                   " a tab is two spaces
set softtabstop=4
set shiftwidth=4
set shiftround
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " unless they contain at least one capital letter
set guioptions-=m               " remove menu
set guioptions-=T               " remove toolbar
set laststatus=2


autocmd! bufwritepost .vimrc source %   " auto-load .vimrc file

" Colorscheme settings
colorscheme molokai

"" }}}


""
"" Mappings {{{
""

let mapleader=","                       " rebind <leader> key
nmap <leader>v :tabedit $MYVIMRC<CR>    " edit vim-file
map <leader>n <esc>:tabprevious<CR>     " easier moving between tabs
map <leader>m <esc>:tabnext<CR>

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

"" }}}


""
"" Plugins {{{


let g:syntastic_python_checkers=['pep8', 'pyflakes']    " Syntastic

" Jedi-python
let g:jedi#usages_command="<leader>z"
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0
map <leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" NERDTree
map <C-n> :NERDTreeToggle<CR>           " CTRL + N open a NERDTreeToogle
let g:NERDTreeWinPos = "right"          " Always in right
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Setting for powerline
" let g:Powerline_symbols = 'fancy'

"" }}}


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
