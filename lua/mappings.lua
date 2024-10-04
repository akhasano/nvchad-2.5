require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n","<leader><leader>w","<cmd> HopWord <CR>", { desc = "hint all words"} )
map("n","<leader><leader>b","<cmd> HopWord <CR>", { desc = "hint all words"} )
map("n","<leader><leader>j","<cmd> HopLine <CR>", { desc = "hint line"} )
map("n","<leader><leader>k","<cmd> HopLine <CR>", { desc = "hint line"} )

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
