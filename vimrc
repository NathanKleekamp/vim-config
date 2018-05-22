execute pathogen#infect()

filetype on
syntax on

set relativenumber
set number
set expandtab
set showmatch
set updatetime=100
set shell=bash\ --login
set clipboard=unnamed
autocmd FileType html setlocal tabstop=2
autocmd FileType hbs setlocal tabstop=2

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
