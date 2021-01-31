local utils = require('utils')

-- Select completion
utils.g_map('i', '<Tab>', [[pumvisible() ? "<C-n>" : "<Tab>"]], { expr = true })
utils.g_map('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<S-Tab>"]], { expr = true })

-- quit window easy
utils.g_map('n', 'qq', '<CMD>q!<CR>')

-- Change active window easily
utils.g_map('n', '<C-j>', '<C-w>j', { noremap = true })
utils.g_map('n', '<C-k>', '<C-w>k', { noremap = true })
utils.g_map('n', '<C-h>', '<C-w>h', { noremap = true })
utils.g_map('n', '<C-l>', '<C-w>l', { noremap = true })

-- easy write file
utils.g_map('n', '<leader>w', ':w<CR>', { noremap = true })

-- remove search highlight
utils.g_map('n', '<leader><CR>', ':nohl<CR>', { noremap = true, silent = true })

-- buffer navigation
utils.g_map('n', ']b', '<CMD>bnext<CR>')
utils.g_map('n', '[b', '<CMD>bprevious<CR>')
utils.g_map('n', '\\b', '<CMD>BufDel<CR>')

-- Copying the vscode behaviour of making tab splits
utils.g_map("n", "<C-\\>", ":vsplit<CR>")
utils.g_map("n", "<A-\\>", ":split<CR>")

-- Move line up and down
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
utils.g_map("n", "<A-DOWN>", ":m .+1<CR>")
utils.g_map("n", "<A-UP>", ":m .-2<CR>")
