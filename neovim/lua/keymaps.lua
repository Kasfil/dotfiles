-- Change active window easily
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- easy write file
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })

-- remove search highlight
vim.api.nvim_set_keymap('n', '<leader><CR>', ':nohl<CR>', { noremap = true, silent = true })

-- fzf.vim
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rg', '<cmd>Rg<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ht', '<cmd>Helptags<CR>', { noremap = true })

-- easymotion
local overwin_f2 = '<cmd>call EasyMotion#OverwinF(2)<CR>'
local overwin_line = '<cmd>call EasyMotion#overwin#line()<CR>'
vim.api.nvim_set_keymap('', 'mf', overwin_f2, { noremap = true })
vim.api.nvim_set_keymap('', 'ml', overwin_line, { noremap = true })

-- completion-nvim
vim.cmd('inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"')
vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"')
vim.cmd([[imap <c-j> <Plug>(completion_next_source)]])
vim.cmd([[imap <c-k> <Plug>(completion_prev_source)]])

-- vsnip
vim.cmd([[imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>']])
vim.cmd([[smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>']])
vim.cmd([[imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']])
vim.cmd([[smap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']])

-- ale-vim
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>ALEFirst<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>ALELast<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>ALENext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>ALEPrevious<CR>', {noremap = true})

-- floaterm
local floaterm_ranger = '<cmd>FloatermNew ranger<CR>'
local floaterm_lazygit = '<cmd>FloatermNew --height=0.9 --width=0.9 lazygit<CR>'
vim.api.nvim_set_keymap('n', '<leader>nn', floaterm_ranger, {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gg', floaterm_lazygit, {noremap = true})
