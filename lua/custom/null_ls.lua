local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {
   b.formatting.clang_format.with {
      filetypes = { "c", "cpp", "cs", "java", "proto" },
   },
   b.code_actions.gitsigns,
   b.formatting.codespell,
}

local M = {}

M.setup = function(on_attach)
   null_ls.config {
      sources = sources,
      -- debug = true,
   }
   require("lspconfig")["null-ls"].setup { on_attach = on_attach }
end

return M
