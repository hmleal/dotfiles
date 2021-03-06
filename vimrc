" -----------------------------------------------------------------------------
" Who: Henrique Leal (@hmleal)
" Contribute: Daniel Bastos (@daniellbastos)
" Description: The vim configuration
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Basic
" -----------------------------------------------------------------------------

set nocompatible        " be iMproved!

" -----------------------------------------------------------------------------
" Plug core
" -----------------------------------------------------------------------------

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

    "" Basic plugins
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-scripts/grep.vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'airblade/vim-gitgutter'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-fugitive'

    "" Color
    Plug 'altercation/vim-colors-solarized'
    Plug 'sickill/vim-monokai'
    Plug 'godlygeek/csapprox'

    "" Python Stack
    Plug 'davidhalter/jedi-vim'
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'Yggdroot/indentLine'

    "" HTML/CSS Stack
    Plug 'gregsexton/MatchTag'
    Plug 'rstacruz/sparkup'
    "" Plug 'miripiruni/CSScomb-for-Vim.git'

    "" Multiple Cursor
    Plug 'terryma/vim-multiple-cursors'
call plug#end()

" -----------------------------------------------------------------------------
"  Regular vim configuration (no plugins need)
" -----------------------------------------------------------------------------

syntax enable                  " turn on syntax highlighting allowing local
set number                     " show line numbers
set ruler                      " show line and column number overrides
set encoding=utf-8             " set default encoding to UTF-8
set listchars=""               " reset the listchars
set listchars=tab:\ \          " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.         " show trailing spaces as dots
set listchars+=extends:>       " the character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:<      " the character to show in the last column when wrap is off and the line continues beyond the left of the screen
set nobackup                   " disable backup before overwriting a file
set nowritebackup              " disable backup before overwriting a file
set noswapfile                 " disable swap file
set cul                        " highlight the screen line of the cursor
set linespace=4                " add some line space for easy reading
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

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite3,*/node_modules/*

" auto-load .vimrc file
autocmd! bufwritepost .vimrc source %

" -----------------------------------------------------------------------------
" Colorscheme settings
" -----------------------------------------------------------------------------

""colorscheme monokai
let g:solarized_termcolors=256
colorscheme solarized
call togglebg#map("<F5>")

" -----------------------------------------------------------------------------
" Abbreviations
:" -----------------------------------------------------------------------------

"" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------

"" rebind <leader> key
let mapleader="\<Space>"

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Easier moving between buffers
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" -----------------------------------------------------------------------------
" Plugins settings
" -----------------------------------------------------------------------------

" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_options = '--disable=C0111'
let g:ale_fixers = {
\    'python': [
\        'isort'
\    ]
\}

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
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = "right"
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:nerdtree_tabs_focus_on_files=1
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

"" Vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" CTRLP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_map='<leader>e'

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" VimFugitive
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Multiple Cursor
let g:multi_cursor_next_key='<C-d>'

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
