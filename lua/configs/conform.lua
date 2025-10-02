local options = {
  lazy = false,
  notify_on_error = false,
  format_on_save = true,
  formatters_by_ft = {
    go = { "gofmt" },
    rust = { "rustfmt" },
    python = { "black" },
    lua = { "stylua" },
    bash = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
    sh = { "shfmt", "shellcheck" },
    css = { "prettier" },
    html = { "prettier" },
    tf = { "terraform_fmt" },
    json = { "jsonnetfmt", "jsonlint" },
    yaml = { "yamlfmt", "yamllint" },
  },
  log_level = vim.log.levels.DEBUG,
}

return options
