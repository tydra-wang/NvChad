local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"
   local on_attach = function (client, bufnr)
      require 'illuminate'.on_attach(client)
      attach(client, bufnr)
   end

   local lspconfig = require "lspconfig"
   lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
      cmd = {'gopls', '--remote=auto'}
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = on_attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
      if server.name == "sumneko_lua" then
         opts.settings = {
            Lua = {
               completion = {
                   keywordSnippet = "Disable",
               },
               diagnostics = {
                   globals = {"vim", "use"},
                   disable = {"lowercase-global"}
               },
               runtime = {
                   version = "LuaJIT",
                   path = vim.split(package.path, ";"),
               },
               workspace = {
                   library = {
                       [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                       [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                   },
               },
            },
         }
      end
      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
   require("custom.null_ls").setup(on_attach)
end

return M
