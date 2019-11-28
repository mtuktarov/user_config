execute pathogen#infect()
execute pathogen#helptags()
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouser=a
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
filetype plugin indent on
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
colorscheme dracula
