local fterm = require 'FTerm'
local utils = require 'utils'

fterm.setup {
  dimension = {
    height = 0.8,
    width = 0.7,
  },
  border = {
    horizontal = '─',
    vertical = '│',
    topLeft = '┌',
    topRight = '┐',
    bottomRight = '┘',
    bottomLeft = '└'
  }
}

utils.g_map('n', '<F12>', '<CMD>lua require"FTerm".toggle()<CR>')
utils.g_map('t', '<F12>', '<C-\\><C-n><CMD>lua require"FTerm".toggle()<CR>')
