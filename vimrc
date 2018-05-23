execute pathogen#infect()

filetype on
syntax on

set encoding=utf8
set relativenumber
set number
set expandtab
set showmatch
set ruler
set wildmenu
set wildmode=list:longest
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set updatetime=100
set shell=bash\ --login
set clipboard=unnamed
set rtp+=/usr/local/opt/fzf
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" More memory
set hidden
set history=100

augroup javascript
  autocmd FileType javascript set colorcolumn=120
  highlight ColorColumn ctermbg=white guibg=white
augroup END

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if has('gui_running')
  colorscheme cobalt2
  set guifont=Menlo:h14
  autocmd! GUIEnter * set vb t_vb=
  set t_Co=256
endif

" disable checking for prepocessors in .vue files
let g:vue_disable_pre_processors=1

augroup ruby
  set re=1
augroup END

" netrw configs
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

"lightline
let g:lightline = { 'colorscheme': 'wombat' }
set laststatus=2
set noshowmode

" Ack
g:ack_use_dispatch=1 " Use vim-dispatch plugin to perform searches in the background
