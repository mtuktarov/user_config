set rtp+=~/vim
execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set mouse=i
set expandtab
set showcmd
set cursorline
set wildmenu
set showmatch
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
filetype plugin indent on
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nnoremap <F3> :<C-U>set number! number? <CR>
colorscheme dracula  

