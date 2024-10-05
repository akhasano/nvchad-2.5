return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
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

  -- format & linting
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

}
