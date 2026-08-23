# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Code Architecture

This is a modern Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a modular structure with clear separation of concerns:

### Core Structure
- `init.lua`: Entry point that loads all configuration modules in order
- `lua/config/`: Core configuration modules
  - `lazy.lua`: Plugin manager bootstrap and setup
  - `basic.lua`: Vim options and basic settings
  - `keymap.lua`: Key mappings and shortcuts
  - `color.lua`: Colorscheme configuration
  - `autocmd.lua`: Auto commands
  - `lsp.lua`: LSP diagnostics display and format-on-save autocmd
- `lua/plugins/`: Individual plugin configurations (one file per plugin)
- `snippets/`: Custom code snippets directory
- `lazy-lock.json`: Plugin version lockfile

### Plugin Management
Uses lazy.nvim for plugin management. Each plugin is configured in its own file under `lua/plugins/`. The configuration automatically imports all plugins from the plugins directory.

Key plugins include:
- LSP: nvim-lspconfig
- Completion: nvim-cmp, cmp-nvim-lsp
- UI: neo-tree.nvim (file explorer), lualine.nvim (statusline), bufferline.nvim
- Code assistance: copilot.vim, LuaSnip (snippets), nvim-autopairs
- Git: gitsigns.nvim
- Theme: tokyonight.nvim

### LSP Configuration
- `lua/plugins/lspconfig.lua`: enables servers via `vim.lsp.enable()`. There is
  no installer plugin (mason.nvim) — each server binary must already be on
  `PATH` (provided by Nix via `nix/home/default.nix`, or installed manually).
  Enabled servers: `lua_ls`, `rust_analyzer`, `gopls`, `ts_ls`, `bashls`.
- `lua/config/lsp.lua`: diagnostic display config (virtual text) and a
  format-on-save autocmd for servers that support `textDocument/formatting`.

### Key Mappings
Leader key is set to space. Notable mappings in `lua/config/keymap.lua`:
- `<C-e>`: Open Neo-tree file explorer
- `jj`: Escape from insert mode
- `;`: Command mode shortcut
- Tab/Shift-Tab: Navigate completion menu

## Development Commands

### Plugin Management
- Install/update plugins: Restart Neovim (lazy.nvim auto-installs missing plugins)
- Update plugins: `:Lazy update`
- Plugin status: `:Lazy`

### LSP Operations
- LSP info: `:LspInfo`
- Format current buffer: `:lua vim.lsp.buf.format()`

### Configuration Testing
To test configuration changes:
1. Save the modified file
2. Restart Neovim or reload with `:source %` for the current file

### Adding New Plugins
Create a new file in `lua/plugins/` following the lazy.nvim specification format. The plugin will be automatically loaded on next startup.