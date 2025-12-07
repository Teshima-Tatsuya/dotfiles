local options = {
    encoding = "utf-8",
    fileencoding = "utf-8",
    title = true,
    backup = false,
    number = true,
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    ignorecase = true,
    smartcase = true,
    autoindent = true,
    smartindent = true,
    cursorline = true,
    completeopt = {
        "fuzzy",
        "popup",
        "menuone",
        "noinsert",
    },
    clipboard = "unnamedplus",
    hidden = true,
    confirm = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
-- set ruler
-- set showmatch
-- set visualbell t_vb=
-- set noswapfile
-- set showcmd
-- set cursorline
-- set backspace=indent,eol,start
-- set nocompatible
-- set hlsearch
-- set noerrorbells
-- set mouse=a
-- set incsearch
-- set hidden
-- set clipboard=unnamed
