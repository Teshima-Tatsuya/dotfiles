return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Add completion capabilities from nvim-cmp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Configure language servers here
		-- Example for lua_ls (Lua Language Server)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Rust
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})

		-- Go
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		-- TypeScript/JavaScript
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		-- Bash
		lspconfig.bashls.setup({
			capabilities = capabilities,
		})
	end,
}