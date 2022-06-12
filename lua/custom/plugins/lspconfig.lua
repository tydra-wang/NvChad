local M = {}

M.setup_lsp = function(attach, capabilities)
   local on_attach = function(client, bufnr)
      require("illuminate").on_attach(client)
      attach(client, bufnr)
   end

   local lspconfig = require "lspconfig"
   lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
      cmd = { "gopls", "--remote=auto" },
   }
end

return M
