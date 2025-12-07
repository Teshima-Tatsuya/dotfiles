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
