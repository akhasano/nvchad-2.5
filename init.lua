vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

if vim.g.neovide then
  local autosave_dir = vim.fn.expand("~/tmp/.neovide-autosave")
  vim.fn.mkdir(autosave_dir, "p")
  vim.cmd("cd " .. autosave_dir)

  vim.api.nvim_create_augroup("NeovideAutoSaveGroup", { clear = true })

  vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
    group = "NeovideAutoSaveGroup",
    callback = function()
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname == "" then
        local filename = os.date("%Y%m%d-%H%M%S")
        local filepath = autosave_dir .. "/" .. filename
        vim.api.nvim_buf_set_name(0, filepath)
        vim.cmd("write")
      end
    end,
  })
end


-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
