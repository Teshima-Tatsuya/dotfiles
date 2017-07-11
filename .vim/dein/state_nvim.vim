if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/vagrant/dotfiles/.vim/init.vim', '/home/vagrant/.vim/rc/dein.toml', '/home/vagrant/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/vagrant/.vim/dein'
let g:dein#_runtime_path = '/home/vagrant/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/vagrant/.vim/dein/.cache/init.vim'
let &runtimepath = '/home/vagrant/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/vagrant/.config/nvim,/etc/xdg/nvim,/home/vagrant/.local/share/nvim/site,/usr/local/share/nvim/site,/home/vagrant/.vim/dein/repos/github.com/Shougo/vimproc.vim,/home/vagrant/.vim/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/vagrant/.vim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/vagrant/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/vagrant/.config/nvim/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim', 'neosnippet', 'neosnippet-snippets'])
