if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/teshima/.vimrc', '/home/teshima/.vim/rc/dein.toml', '/home/teshima/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/teshima/.vim/dein'
let g:dein#_runtime_path = '/home/teshima/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/teshima/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/teshima/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/teshima/.vim,/home/teshima/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/teshima/.vim/after,/home/teshima/.vim/dein/.cache/.vimrc/.dein/after'
filetype off
