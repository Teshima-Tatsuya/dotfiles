local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Terminal
local terminal_group = augroup("Terminal", { clear = true })

-- Terminal移動時に自動でInsertモードに
autocmd({ "BufWinEnter", "WinEnter" }, {
	group = terminal_group,
	pattern = "term://*",
	command = "startinsert",
})

-- Terminal離脱時にNormalモードに
autocmd("BufLeave", {
	group = terminal_group,
	pattern = "term://*",
	command = "stopinsert",
})

-- その他の便利なautocmd
local general_group = augroup("General", { clear = true })

-- ウィンドウサイズ変更時に自動調整
autocmd("VimResized", {
	group = general_group,
	command = "tabdo wincmd =",
})

-- LSP関連
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("my.lsp", {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     -- 補完の設定
--     if client:supports_method('textDocument/completion') then
--       -- 文字を入力する度に補完を表示（遅くなる可能性あり）
--       local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       client.server_capabilities.completionProvider.triggerCharacters = chars
--       -- 補完を有効化
--       vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--     end
--     -- フォーマット
--     if not client:supports_method('textDocument/willSaveWaitUntil')
--       and client:supports_method('textDocument/formatting') then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({bufnr = args.buf, id = client.id, timeout_ms = 3000})
--         end,
--       })
--     end
--   end,
-- })
