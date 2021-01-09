local U = require('utils')
local g = vim.g
local api = vim.api

g.EasyMotion_show_prompt = true
g.EasyMotion_do_mapping = false
g.EasyMotion_smartcase = true
g.EasyMotion_verbose = true
g.EasyMotion_do_shade = true
g.EasyMotion_off_screen_search = true

U.g_map('n', 'mf', '<Plug>(easymotion-overwin-f2)', { noremap = true })
U.g_map('n', 'ml', '<Plug>(easymotion-bd-jk)', { noremap = true })

api.nvim_exec([[
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
]], '')
