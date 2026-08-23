vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('n', ';', ':')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- " buffer
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true, desc = "Next buffer" })
vim.keymap.set('n', '[b', ':bprev<CR>', { silent = true, desc = "Next buffer" })
