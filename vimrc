execute pathogen#infect()

filetype on
syntax on

let mapleader=' '

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
set shell=bash\ --login
set clipboard=unnamed,unnamedplus
set rtp+=/usr/local/opt/fzf
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
set background=dark

" Set backupcopy to yes to avoid system file watching issues per
" https://webpack.js.org/configuration/watch/#vim
set backupcopy=yes

" swapfiles
set swapfile
set dir=~/.vim/temp

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" More memory
set hidden
set history=100

au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

augroup javascript
  autocmd!
  autocmd FileType javascript set colorcolumn=120
  highlight ColorColumn ctermbg=white guibg=white

  autocmd FileType javascript nnoremap <buffer> <leader># I//<esc>
augroup END

augroup vue
  autocmd!
  autocmd BufNewFile *.vue 0r ~/.vim/templates/skeleton.vue
augroup END

augroup text
  autocmd!
  function! SetTextOptions()
    set wrap
    set linebreak
    set spell
    set syntax=off
  endfunction
  autocmd FileType text,markdown call SetTextOptions()
augroup END

augroup projects
  au BufRead,BufEnter /Users/nkleekamp/Projects/costar-suite/* set tabstop=4 shiftwidth=4 softtabstop=4
augroup END

if executable('ag')
  set grepprg=ag\ --vimgrep
  let g:ackprg = 'ag --vimgrep'
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  let g:ackprg = 'rg --vimgrep'
endif

if has('gui_running')
  colorscheme cobalt2
  set guifont=Menlo:h16
  autocmd! GUIEnter * set vb t_vb=
  set t_Co=256
endif

" disable checking for prepocessors in .vue files
let g:vue_disable_pre_processors=1

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

" Disable Gutentags by default
let g:gutentags_dont_load=1

let g:ale_javascript_eslint_executable='eslint_d'
let g:ale_javascript_eslint_use_global=1

" Add Ale support for Prettier
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'json': ['prettier', 'eslint'],
\ 'css': ['prettier', 'eslint'],
\ 'markdown': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\}
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1

" iTerm configuration
if $TERM_PROGRAM =~ "iTerm"
  " Vertical bar in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"

  " Block in normal mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Change cursor shape based on mode in Gnome-Terminal
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

source ~/.vim/sources/abbr.vim
source ~/.vim/sources/maps.vim
