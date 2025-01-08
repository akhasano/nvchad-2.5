local M = {}
-- quickfix for LSP
M.opts = { noremap = true, silent = true }

function M.quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end

return M
