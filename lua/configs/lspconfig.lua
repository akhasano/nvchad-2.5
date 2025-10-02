local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  gopls = { settings = { gopls = { gofumpt = true } } },
  terraformls = {},
  bashls = {},
  ansiblels = {},
  pyright = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", {
    capabilities = nvlsp.capabilities,
    flags = { debounce_text_changes = 150 },
  }, opts))
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    nvlsp.on_attach(client, bufnr)
  end,
})

