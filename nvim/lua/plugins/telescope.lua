local telescope = require'telescope'
local utils = require 'utils'

telescope.setup {
  defaults = {
    file_ignore_patter = { 'node_module/*', 'vendor/*', '.git/' },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    set_env = { ['COLORTERM'] = 'truecolor' },
  },
}

utils.g_map('n', '<leader>ff', '<CMD>lua require"telescope.builtin".find_files{}<CR>')
utils.g_map('n', '<leader>fh', '<CMD>lua require"telescope.builtin".help_tags{}<CR>')
utils.g_map('n', '<leader>fb', '<CMD>lua require"telescope.builtin".buffers{}<CR>')
utils.g_map('n', '<leader>rg', '<CMD>lua require"telescope.builtin".grep_string{}<CR>')
