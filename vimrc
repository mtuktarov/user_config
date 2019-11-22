execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
colorscheme dracula
set tabstop=4
set expandtab
set number
set showcmd
set cursorline
set wildmenu
set showmatch
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set mouse=a
