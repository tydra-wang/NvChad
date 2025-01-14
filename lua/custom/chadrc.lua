local M = {}

M.options = {
   -- custom = {}
   -- general nvim/vim options , check :h optionname to know more about an option

   relativenumber = true,
   shiftwidth = 4,
   tabstop = 4,
   timeoutlen = 400,
   updatetime = 650,
}

M.ui = {
   italic_comments = true,
   theme = "solarized",
}

M.plugins = {
   status = {
      dashboard = true,
      better_escape = false,
      vim_matchup = false,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.lspconfig",
      },
      nvimtree = {
         enable_git = 1,
         ui = {
            width = 38,
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
