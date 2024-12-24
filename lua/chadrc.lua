-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
}

M.ui = {
  telescope = {
    style = "bordered",
  },
}

M.term = {
  float = {
    border = "rounded", -- стиль границы окна (можно использовать "single", "double" и др.)
    row = 0.05,
    col = 0.05,
    width = 0.9,
    height = 0.8,
  }
}


return M
