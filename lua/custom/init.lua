vim.cmd "set shell=zsh"
vim.cmd "set nowrap"

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

local map = require("core.utils").map

map("n", "<leader><leader>", "<Plug>(easymotion-overwin-f2)", { noremap = false })
map("n", "gn", "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>")
map("n", "gp", "<cmd>lua require'illuminate'.next_reference{wrap=true, reverse=true}<cr>")
map("n", "<leader><tab>", ":BufferLinePick <CR>")
