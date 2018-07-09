execute pathogen#infect()

filetype on
syntax on

let mapleader=','

set encoding=utf8
set relativenumber
set number
set showmatch
set ruler
set wildmenu
set wildmode=list:longest
set nowrap
set nolinebreak
set nolist
set updatetime=100
set tabstop=2
set shiftwidth=2
set shell=bash\ --login
set clipboard=unnamed
set rtp+=/usr/local/opt/fzf
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

" swapfiles
set swapfile
set dir=~/.vim/temp

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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

" Move a line of text using CTRL+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <c-j> <M-j>
  nmap <c-k> <M-k>
  vmap <c-j> <M-j>
  vmap <c-k> <M-k>
endif

" netrw configs
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

"lightline
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \ },
\ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Ack
" Use vim-dispatch plugin to perform searches in the background
let g:ack_use_dispatch=1

" Disable Gutentags by default
let g:gutentags_dont_load=1

" DISABLED
" autocmd FileType html setlocal tabstop=2
" autocmd FileType hbs setlocal tabstop=2

