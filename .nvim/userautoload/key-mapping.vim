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

" Insert mode To Nomal mode keymap
inoremap <silent> jj <ESC>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" For terminal
tnoremap <Esc> <C-\><C-n>
