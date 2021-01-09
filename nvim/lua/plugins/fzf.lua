local U = require('utils')
local g = vim.g
local fzf_window = {
  window = {
    width = 0.9,
    height = 0.8,
  },
}

g.fzf_preview_window = {'right:50%'}
g.fzf_layout = fzf_window
g.fzf_colors = { border = { 'fg', 'keyword' }}

U.g_map('n', '<leader>ff', '<cmd>Files<CR>', { noremap = true })
U.g_map('n', '<leader>fb', '<cmd>Buffers<CR>', { noremap = true })
U.g_map('n', '<leader>rg', '<cmd>Rg<CR>', { noremap = true })
U.g_map('n', '<leader>fh', '<cmd>Helptags<CR>', { noremap = true })
