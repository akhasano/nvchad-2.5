require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n","<leader><leader>w","<cmd> HopWord <CR>", { desc = "hint all words"} )
map("n","<leader><leader>b","<cmd> HopWord <CR>", { desc = "hint all words"} )
map("n","<leader><leader>j","<cmd> HopLine <CR>", { desc = "hint line"} )
map("n","<leader><leader>k","<cmd> HopLine <CR>", { desc = "hint line"} )

map("n","<leader>lc","<cmd> %bd <CR>", { desc = "close all buffers"} )
map("n","<leader>lo","<cmd> %bd|e#|bd# <CR>", { desc = "close all buffers except this"} )

map("t","<Leader><ESC>","<C-\\><C-n>",{noremap = true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
