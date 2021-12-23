return {
   {
      "easymotion/vim-easymotion",
      config = function()
         vim.g.EasyMotion_do_mapping = 0
         vim.g.EasyMotion_smartcase = 1
      end,
   },
   {
      "fatih/vim-go",
      config = function()
         vim.g.go_def_mapping_enabled = 0
         vim.g.go_doc_keywordprg_enabled = 0
      end,
   },
   {
      "buoto/gotests-vim",
   },
   {
      "preservim/tagbar",
   },
   {
      "ianding1/leetcode.vim",
      disable = true,
      config = function()
         vim.g.leetcode_china = 1
         vim.g.leetcode_solution_filetype = "golang"
         vim.g.leetcode_browser = "chrome"
      end,
   },
   {
      "williamboman/nvim-lsp-installer",
   },
   {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
   },
   {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   },
   {
      "RRethy/vim-illuminate",
      config = function()
         vim.cmd [[ hi def link LspReferenceText CursorColumn ]]
         vim.cmd [[ hi def link LspReferenceWrite CursorColumn ]]
         vim.cmd [[ hi def link LspReferenceRead CursorColumn ]]
      end,
   },
   {
      "kshenoy/vim-signature",
   },
}
