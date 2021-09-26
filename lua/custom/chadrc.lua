local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
   shiftwidth = 4,
   tabstop = 4,
   timeoutlen = 700,
   relativenumber = true,
}

M.ui = {
   italic_comments = true,
   theme = "solarized",
}

M.plugins = {
   status = {
      dashboard = true,
      esc_insertmode = false,
      vim_matchup = false,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.lspconfig",
      },
      nvimtree = {
         enable_git = 1,
      },
   },
   default_plugin_config_replace = {},
}

return M
