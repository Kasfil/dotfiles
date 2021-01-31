local g = vim.g
local utils = require 'utils'

-- nvim_tree.lua config
g.nvim_tree_side = 'right'
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'vendor' }
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_git_hl = 1

utils.g_map('n', '<leader>nn', '<CMD>NvimTreeToggle<CR>')
utils.g_map('n', '<leader><leader>nn', '<CMD>NvimTreeRefresh<CR>')
