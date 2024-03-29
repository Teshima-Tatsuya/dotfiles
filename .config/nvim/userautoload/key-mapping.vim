" Leader
let mapleader = "\<Space>"
" key mapping
nnoremap j gj
nnoremap k gk

" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :first<CR>
nnoremap <silent> ]B :blast<CR>

" tab
nnoremap <silent> T <C-W>T<CR>

" Denite
nnoremap <Leader>df :Denite<Space>file_mru<CR>
nnoremap <Leader>dp :Denite<Space>file_rec/git<CR>

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
