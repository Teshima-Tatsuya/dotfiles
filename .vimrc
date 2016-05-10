 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'w0ng/vim-hybrid'
 NeoBundle 'scrooloose/nerdtree'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck



" show row number
set number
" set tab width 4
set tabstop=4
" highlight searching word
set hlsearch

"
" colors setting
"
" set screen colors 256
set t_Co=256
colorscheme hybrid

set ruler
set noswapfile
set title
set incsearch
set visualbell

nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <CR> A<CR><ESC>
noremap <S-h> ^
noremap <S-l> $

