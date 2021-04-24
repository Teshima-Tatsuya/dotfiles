" key mapping
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :first<CR>
nnoremap <silent> ]B :blast<CR>

" tab
nnoremap <silent> T <C-W>T<CR>
" unite
nnoremap <C-f> :Denite<Space>file_mru<CR>
nnoremap <C-p> :Denite<Space>file_rec/git<CR>

" Defx
nnoremap <silent><C-e> :Defx<CR>

" Insert mode To Nomal mode keymap
inoremap <silent> jj <ESC>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" For terminal
tnoremap <Esc> <C-\><C-n>
