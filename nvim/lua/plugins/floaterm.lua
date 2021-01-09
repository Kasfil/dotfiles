local U = require('utils')
local g = vim.g

g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.floaterm_autoclose = true

g.floaterm_keymap_new = '<F7>'
g.floaterm_keymap_next = '<F8>'
g.floaterm_keymap_prev = '<F9>'
g.floaterm_keymap_toggle = '<F12>'

U.g_map('n', '<leader>gg', '<CMD>FloatermNew lazygit<CR>')
