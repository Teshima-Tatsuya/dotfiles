return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- Set global capabilities for all LSP servers
        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })

        -- Enable LSP servers
        local servers = {
            'lua_ls',
            'rust_analyzer',
            'gopls',
            'ts_ls',
            'bashls',
        }

        for _, server in ipairs(servers) do
            vim.lsp.enable(server)
        end
    end,
}

