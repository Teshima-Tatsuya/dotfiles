" key mapping
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :first<CR>
nnoremap <silent> ]B :blast<CR>

" unite
nnoremap <C-f> :Denite<Space>file_mru<CR>
nnoremap <C-p> :Denite<Space>file_rec/git<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" tagbar
nmap <F8> :TagbarToggle<CR>

inoremap <silent> jj <ESC>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
