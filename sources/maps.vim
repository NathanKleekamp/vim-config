" Searching
nnoremap / /\v
vnoremap / /\v

if has("mac") || has("macunix")
  nmap <c-j> <M-j>
  nmap <c-k> <M-k>
  vmap <c-j> <M-j>
  vmap <c-k> <M-k>
endif

" Move a line of text using CTRL+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <leader>a :Ack!<Space>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>em :vsplit ~/.vim/sources/maps.vim<cr>
nnoremap <leader>ea :vsplit ~/.vim/sources/abbr.vim<cr>
nnoremap <leader>t :vert term<cr>
nnoremap <leader>h :vert help<Space>

" Copy current file path
nnoremap <leader>cfp :let @*=@%<cr>
