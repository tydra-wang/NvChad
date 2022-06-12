local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd("FileType", {
   pattern = "lua",
   callback = function()
      opt.shiftwidth = 3
      opt.tabstop = 3
      opt.softtabstop = 3
   end,
})

autocmd("FileType", {
   pattern = "go",
   callback = function()
      opt.expandtab = false
   end,
})

-- hide quickfix in bufferline
-- https://github.com/akinsho/bufferline.nvim/issues/176
autocmd("FileType", {
   pattern = "qf",
   callback = function()
      opt.buflisted = false
   end,
})

-- Open a file from its last left off position
-- vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
autocmd("BufReadPost", {
   pattern = "*",
   callback = function()
      vim.cmd [[ if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
   end,
})
