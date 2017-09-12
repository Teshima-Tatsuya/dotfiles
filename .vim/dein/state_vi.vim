if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/tatsuya/.vimrc', '/Users/tatsuya/.vim/rc/dein.toml', '/Users/tatsuya/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/tatsuya/.vim/dein'
let g:dein#_runtime_path = '/Users/tatsuya/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/tatsuya/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/tatsuya/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/tatsuya/.vim,/Users/tatsuya/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/tatsuya/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/tatsuya/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/Users/tatsuya/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/tatsuya/.vim/after'
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim', 'neosnippet', 'neosnippet-snippets'])
