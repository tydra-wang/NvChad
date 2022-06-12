local M = {}

M.options = {
   -- load your options here or load module with options1
   user = function()
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.wrap = false
   end,

   nvChad = {
      -- updater
      update_url = "https://github.com/tydra-wang/NvChad",
      update_branch = "main",
   },
}

M.ui = {
   hl_override = {
      LspReferenceText = { fg = "none", bg = "one_bg2" },
      LspReferenceRead = { fg = "none", bg = "one_bg2" },
      LspReferenceWrite = { fg = "none", bg = "one_bg2" },
   },
}

M.plugins = {
   remove = {
      "andymass/vim-matchup",
      "max397574/better-escape.nvim",
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   override = {
      ["kyazdani42/nvim-tree.lua"] = {
         view = {
            width = 40,
         },
         git = {
            enable = true,
            ignore = true,
         },
      },
      ["nvim-telescope/telescope.nvim"] = {
         defaults = {
            file_ignore_patterns = { "node_modules", "vendor", "go.sum" },
         },
      },
   },
   user = {
      -- basic plugins
      ["easymotion/vim-easymotion"] = {
         config = function()
            vim.g.EasyMotion_do_mapping = 0
            vim.g.EasyMotion_smartcase = 1
         end,
      },
      ["karb94/neoscroll.nvim"] = {
         config = function()
            require("neoscroll").setup()
         end,
      },
      ["kshenoy/vim-signature"] = {},

      -- golang plugins
      ["fatih/vim-go"] = {
         disable = true,
         config = function()
            vim.g.go_def_mapping_enabled = 0
            vim.g.go_doc_keywordprg_enabled = 0
         end,
      },
      -- ["buoto/gotests-vim"] = {},

      -- lsp related plugins
      ["jose-elias-alvarez/null-ls.nvim"] = {
         after = "nvim-lspconfig",
         config = function()
            require("custom.plugins.nullls").setup()
         end,
      },
      ["RRethy/vim-illuminate"] = {},
      -- ["preservim/tagbar"] = {},
   },
}

M.mappings = {
   all = {
      n = {
         ["<leader><leader>"] = { "<Plug>(easymotion-overwin-f2)", "easymotion-overwin-f2" },
         ["gn"] = { "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>", "go to next reference" },
         ["gp"] = {
            "<cmd>lua require'illuminate'.next_reference{wrap=true, reverse=true}<cr>",
            "go to last reference",
         },
         ["<leader>fl"] = { "<cmd> :Telescope resume <CR>", "telescope resume" },
      },
   },
}

return M
