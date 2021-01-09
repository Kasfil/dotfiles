local U = require('utils')

-- Change active window easily
U.g_map('n', '<C-j>', '<C-w>j', { noremap = true })
U.g_map('n', '<C-k>', '<C-w>k', { noremap = true })
U.g_map('n', '<C-h>', '<C-w>h', { noremap = true })
U.g_map('n', '<C-l>', '<C-w>l', { noremap = true })

-- easy write file
U.g_map('n', '<leader>w', ':w<CR>', { noremap = true })

-- remove search highlight
U.g_map('n', '<leader><CR>', ':nohl<CR>', { noremap = true, silent = true })

-- buffer navigation
U.g_map('n', ']b', '<CMD>bnext<CR>')
U.g_map('n', '[b', '<CMD>bprevious<CR>')

-- Copying the vscode behaviour of making tab splits
U.g_map("n", "<C-\\>", ":vsplit<CR>")
U.g_map("n", "<A-\\>", ":split<CR>")

-- Move line up and down
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
U.g_map("n", "<A-DOWN>", ":m .+1<CR>")
U.g_map("n", "<A-UP>", ":m .-2<CR>")

-- easymotion
local overwin_f2 = '<cmd>call EasyMotion#OverwinF(2)<CR>'
local overwin_line = '<cmd>call EasyMotion#overwin#line()<CR>'
U.g_map('', 'mf', overwin_f2, { noremap = true })
U.g_map('', 'ml', overwin_line, { noremap = true })

-- floaterm
local floaterm_lazygit = '<cmd>FloatermNew --height=0.9 --width=0.9 lazygit<CR>'
U.g_map('n', '<leader>gg', floaterm_lazygit, {noremap = true})
