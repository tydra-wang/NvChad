-- easymotion settings
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', '<leader><Leader>', '<Plug>(easymotion-overwin-f2)', { silent = true })

vim.cmd 'set shell=zsh'
