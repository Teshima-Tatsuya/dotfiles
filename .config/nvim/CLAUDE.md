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
  - `lsp.lua`: LSP configuration with auto-formatting and completion
- `lua/plugins/`: Individual plugin configurations (one file per plugin)
- `snippets/`: Custom code snippets directory
- `lazy-lock.json`: Plugin version lockfile

### Plugin Management
Uses lazy.nvim for plugin management. Each plugin is configured in its own file under `lua/plugins/`. The configuration automatically imports all plugins from the plugins directory.

Key plugins include:
- LSP: mason.nvim, nvim-lspconfig, mason-lspconfig.nvim
- UI: neo-tree.nvim (file explorer), lualine.nvim (statusline), bufferline.nvim
- Code assistance: copilot.vim, LuaSnip (snippets), nvim-autopairs
- Git: gitsigns.nvim
- Theme: tokyonight.nvim

### LSP Configuration
LSP is configured in `lua/config/lsp.lua` with:
- Auto-completion enabled with trigger on every character
- Auto-formatting on save for supported language servers
- Diagnostic configuration with virtual text enabled

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
- Mason (LSP installer): `:Mason`

### Configuration Testing
To test configuration changes:
1. Save the modified file
2. Restart Neovim or reload with `:source %` for the current file

### Adding New Plugins
Create a new file in `lua/plugins/` following the lazy.nvim specification format. The plugin will be automatically loaded on next startup.