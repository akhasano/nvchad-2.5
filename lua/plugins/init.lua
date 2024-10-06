return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      pkgs = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "gopls",
        "terraformls",
      },
    },
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
      pkgs = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "terraform",
      },
    },
  },

  {
    "phaazon/hop.nvim",
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require "configs.hop"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('configs.tabout')
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    opt = true,  -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },

}
