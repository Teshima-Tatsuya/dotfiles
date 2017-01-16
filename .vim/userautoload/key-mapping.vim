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

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
