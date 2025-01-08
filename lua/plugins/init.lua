return {
  {
    -- Lightweight yet powerful formatter plugin for Neovim
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    -- wrapper for LSP Servers
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        ui = {
          border = "rounded",
        },
      }
    end,
  },

  {
    -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "go",
          "terraform",
          "json",
          "yaml",
          "c",
          "bash",
          "make",
          "python",
          "javascript",
          "typescript",
        },
      }
    end,
  },

  {
    -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
    "smoka7/hop.nvim",
    -- lazy = false,
    version = "v2.7.2",
    opts = {
      keys = "sdfghjklcvbnm",
    },
  },

  {
    -- Super fast git decorations implemented purely in Lua.
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    -- A lot of people have mappings like jk or jj to escape insert mode.
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    -- Supercharge your workflow and start tabbing out from parentheses, quotes, and similar contexts today.
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require "configs.tabout"
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true,              -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },

  {
    -- snippet engine
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },

  {
    -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    "sindrets/diffview.nvim",
  },

  {
    -- debugger
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" }
  },
}
