vim.keymap.set('n', '<C-e>', ':Neotree filesystem reveal left<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('n', ';', ':')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- 補完時のTab/Shift-Tab移動
vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	else
		return "<Tab>"
	end
end, { expr = true, desc = "Next completion or Tab" })

vim.keymap.set("i", "<S-Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	else
		return "<S-Tab>"
	end
end, { expr = true, desc = "Previous completion or Shift-Tab" })

-- " key mapping
-- nnoremap j gj
-- nnoremap k gk
--
-- " buffer
-- nnoremap <silent> [b :bprevious<CR>
-- nnoremap <silent> ]b :bnext<CR>
-- nnoremap <silent> [B :first<CR>
-- nnoremap <silent> ]B :blast<CR>
--
-- " tab
-- nnoremap <silent> T <C-W>T<CR>
--
-- " For terminal
-- tnoremap <Esc> <C-\><C-n>
