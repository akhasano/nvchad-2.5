-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- список серверов
local servers = { "html", "cssls", "gopls", "terraformls", "bashls", "ansiblels", "pyright" }

-- настройка LSP через новый API
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = nvlsp.capabilities,
    flags = { debounce_text_changes = 150 },
  })
end

-- включение LSP
vim.lsp.enable(servers)

-- обработка on_attach теперь делается через автокоманду
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    nvlsp.on_attach(client, bufnr)
  end,
})

