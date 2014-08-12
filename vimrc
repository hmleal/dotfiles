"*****************************************************************************
" Vundle core
"*****************************************************************************

set nocompatible        " be iMproved!
filetype off


set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"*****************************************************************************
"" My Plugins
"*****************************************************************************

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    "" My Plugins here:
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'gregsexton/MatchTag'
    Plugin 'tpope/vim-fugitive'
    Plugin 'SirVer/ultisnips'
    Plugin 'tpope/vim-markdown'
    Plugin 'miripiruni/CSScomb-for-Vim.git'
    Plugin 'bronson/vim-trailing-whitespace'

    "" Color
    Plugin 'tomasr/molokai'

    "" Python Bundle
    Plugin 'davidhalter/jedi-vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/syntastic'
    Plugin 'Yggdroot/indentLine'

    "" HTML
    Plugin 'hail2u/vim-css3-syntax'

call vundle#end()


filetype plugin indent on    " enable syntax highlighting, required

"*****************************************************************************
"" Basic Setup
"*****************************************************************************

syntax enable                  " Turn on syntax highlighting allowing local
set number                     " show line numbers
set ruler                      " show line and column number
                               " overrides
set encoding=utf-8             " set default encoding to UTF-8
set listchars=""               " Reset the listchars
set listchars=tab:\ \          " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.         " show trailing spaces as dots
set listchars+=extends:>       " The character to show in the last column when wrap is
                               " off and the line continues beyond the right of the screen
set listchars+=precedes:<      " The character to show in the last column when wrap is
                               " off and the line continues beyond the left of the screen
set clipboard=unnamedplus      " Better Copy & Paste
set nobackup                   " disable backup before overwriting a file
set nowritebackup              " disable backup before overwriting a file
set noswapfile                 " disable swap file
set cul                        " Highlight the screen line of the cursor
set linespace=4                " Add some line space for easy reading
set colorcolumn=80             " Useful to align text
set expandtab                  " use spaces, not tabs
set list                       " show invisible characters
set tabstop=4                  " a tab is two spaces
set softtabstop=4
set shiftwidth=4
set shiftround
set backspace=indent,eol,start " backspace through everything in insert mode

""" Searching
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive...
set smartcase                  " unless they contain at least one capital letter

set guioptions-=m              " remove menu
set guioptions-=T              " remove toolbar
set laststatus=2
set nofoldenable
set t_Co=256
set title
set titleold="Terminal"
set titlestring=%F

" auto-load .vimrc file
autocmd! bufwritepost .vimrc source %

"*****************************************************************************
"" Colorscheme settings
"*****************************************************************************
colorscheme molokai

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" rebind <leader> key
let mapleader=","

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Easier moving between tabs
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>

"*****************************************************************************
"" Plugins settings
"*****************************************************************************

"" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1


"" Syntastic python
let g:syntastic_python_checkers=['pep8', 'pyflakes']


" Jedi-python
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"


"" NERDTree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = "right"
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:nerdtree_tabs_focus_on_files=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>


"" Vim-airline
let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#virtualenv#enabled = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1


"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


"" CTRLP
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
