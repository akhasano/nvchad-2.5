require "nvchad.mappings"
-- add yours here
require('hop')
require('configs.dap')

local qf = require("configs.quickfix")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n", "<leader><leader>w", "<cmd> HopWord <CR>", { desc = "hint all words" })
map("n", "<leader><leader>j", "<cmd> HopLine <CR>", { desc = "hint line" })

map("n", "<leader>lc", "<cmd> %bd <CR>", { desc = "close all buffers" })
map("n", "<leader>lo", "<cmd> %bd|e#|bd# <CR>", { desc = "close all buffers except this" })

map("t", "<leader><ESC>", "<C-\\><C-n>", { noremap = true })
-- settings from quickfix.lua
map("n", "<leader>qf", qf.quickfix, qf._opts)

map('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
map('n', '<F10>', ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
map('n', '<F11>', ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
map('n', '<F12>', ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>',
  { noremap = true, silent = true, desc = "set/unset breakpoint" })
map('n', '<leader>dc', ':lua require"dap".continue()<CR>', { noremap = true, silent = true, desc = 'Continue' })
map('n', '<leader>dB', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
  { noremap = true, silent = true, desc = "set/unset conditional breakpoint" })
map('n', '<leader>dr', ':lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
map('n', '<leader>dC', ':lua require("dap").run_to_cursor()', { desc = "Run to Cursor" })
map('n', '<leader>dT', ':lua require("dap").terminate()', { desc = "Terminate" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
