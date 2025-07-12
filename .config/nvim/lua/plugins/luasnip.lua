return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local luasnip = require("luasnip")
		
		-- Load snippets from friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		
		-- Load custom snippets
		require("luasnip.loaders.from_lua").load({
			paths = { "~/.config/nvim/snippets" },
		})
		
		-- Set up snippet jumping behavior
		luasnip.config.setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})
	end,
}
