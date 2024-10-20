local options = {
  lazy = false,
  keys = {
    {
      "<leader>fs",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  notify_on_error = false,
  format_on_save = true,
  formatters_by_ft = {
    go = { "gofmt" },
    rust = { "rustfmt" },
    python = { 'black' },
    c = { "clang_format" },
    lua = { "stylua" },
    bash = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
    sh = { "shfmt", "shellcheck" },
    css = { "prettier" },
    html = { "prettier" },
    tf = { "terraform_fmt" },
    json = { "jsonnetfmt" },
    yaml = { "yamlfmt" },
  },
  log_level = vim.log.levels.DEBUG,

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
