vim.cmd 'set shell=zsh'
vim.cmd 'set nowrap'

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- tabs (default expandtab=true, tabstop=4)
-- vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
vim.cmd [[ autocmd Filetype lua setlocal shiftwidth=3 tabstop=3 softtabstop=3 ]]
vim.cmd [[ autocmd Filetype proto setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]]
vim.cmd [[ autocmd Filetype go setlocal noexpandtab ]]

-- hide quickfix in bufferline
-- https://github.com/akinsho/bufferline.nvim/issues/176
vim.cmd [[ autocmd Filetype qf setlocal nobuflisted ]]

local hooks = require "core.hooks"

-- mappings
hooks.add("setup_mappings", function(map)
   map("n", "<leader><leader>", "<Plug>(easymotion-overwin-f2)", { noremap = false })
   map("n", "gn", "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>")
   map("n", "gp", "<cmd>lua require'illuminate'.next_reference{wrap=true, reverse=true}<cr>")
   map("n", "<leader><tab>", ":BufferLinePick <CR>")
end)

-- plugins
hooks.add("install_plugins", function(use)
   use {
      'easymotion/vim-easymotion',
      config = function()
         vim.g.EasyMotion_do_mapping = 0
         vim.g.EasyMotion_smartcase = 1
      end
   }
   use {
      'fatih/vim-go',
      config = function()
         vim.g.go_def_mapping_enabled = 0
         vim.g.go_doc_keywordprg_enabled = 0
      end
   }
   use {
      'preservim/tagbar',
   }
   use {
      'ianding1/leetcode.vim',
      disable = true,
      config = function ()
         vim.g.leetcode_china = 1
         vim.g.leetcode_solution_filetype = 'golang'
         vim.g.leetcode_browser = 'chrome'
      end
   }
   use {
      "williamboman/nvim-lsp-installer",
   }
   use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
   }
   use {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   }
   use {
      "RRethy/vim-illuminate",
      config = function()
         vim.cmd [[ hi def link LspReferenceText CursorColumn ]]
         vim.cmd [[ hi def link LspReferenceWrite CursorColumn ]]
         vim.cmd [[ hi def link LspReferenceRead CursorColumn ]]
      end
   }
   use {
      "kshenoy/vim-signature"
   }
end)

