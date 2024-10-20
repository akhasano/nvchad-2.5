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

--fix terraform and hcl comment string
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})
