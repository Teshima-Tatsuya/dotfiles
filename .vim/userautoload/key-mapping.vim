" key mapping
noremap j gj
noremap k gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" unite
nnoremap <C-f> :Unite<Space>file_mru<CR>
nnoremap <C-p> :Unite<Space>file_rec/git<CR>

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
