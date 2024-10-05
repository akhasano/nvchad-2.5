require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.cmd('set autochdir')
vim.cmd('set mouse=n')
vim.cmd('set foldmethod=indent')
vim.cmd('set foldlevel=100')
vim.cmd('set clipboard=unnamedplus')
vim.cmd('set number')
vim.cmd('set relativenumber')  -- Включаем относительные номера строк
vim.cmd('set whichwrap=b,s') -- Выключить переход на новую строку при достижении конца строки курсором

require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})

