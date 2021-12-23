local M = {}

M.options = {
   -- custom = {}
   -- general nvim/vim options , check :h optionname to know more about an option

   relativenumber = true,
   shiftwidth = 4,
   tabstop = 4,
   updatetime = 650,
}

M.ui = {
   italic_comments = true,
   theme = "solarized",
}

M.plugins = {
   status = {
      better_escape = false,
      vim_matchup = false,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.lspconfig",
      },
   },
   install = require "custom.plugins",
   default_plugin_config_replace = {
      nvim_tree = {
         view = {
            width = 38,
         },
         git = {
            enable = true,
         },
      },
   },
}
M.mappings = {
   misc = {
      new_tab = "<C-x>b", -- for better <C-t> to jump back
   },
}

return M
