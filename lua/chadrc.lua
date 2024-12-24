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
    col = 0.02,
    row = 0,
    width = 0.96,
    height = 0.9,
  }
}


return M
