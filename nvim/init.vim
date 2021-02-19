" -------------------------------
" Who: Henrique Leal (@hmleal)
" Description: Nvim configuration
" -------------------------------
call plug#begin(stdpath('data') . '/plugged')
    Plug 'dense-analysis/ale'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/indentLine'
    "" Plug 'caenrique/nvim-toggle-terminal'
call plug#end()

set colorcolumn=80
set cursorline
set number
set splitbelow
set splitright

""set expandtab tabstop=4 softtabstop=4 shiftwidth=4

"" for yaml files, 2 spaces
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

colorscheme dracula

" -------------------------------
" Abbreviations
" -------------------------------
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" -------------------------------
" Mappings
" -------------------------------

"" Rebind <leader> key
let mapleader="\<Space>"

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"" Buffer controls
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>

"" Terminal
nnoremap <silent> <leader>tt :split<CR>:resize 10<CR>:terminal<CR>

tnoremap <ESC> <C-\><C-n>
tnoremap <C-x> <C-\><C-n><C-w>q

tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l
tnoremap <c-h> <C-\><C-n><C-w>h

" -------------------------------
" Plugins settings
" -------------------------------

"" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_python_pylint_options = '--disable=C0111'

"" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" Vim-airline
let g:airline_theme='dracula'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
