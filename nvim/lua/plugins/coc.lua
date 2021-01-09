local api = vim.api
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local U = require('utils')

g.coc_global_extensions = {
  'coc-json',
  'coc-yaml',
  'coc-snippets',
  'coc-tsserver',
  'coc-python',
  'coc-phpls',
  'coc-vimlsp',
  'coc-go',
  'coc-css',
  'coc-emmet',
  'coc-actions',
  'coc-pairs',
}

function _G.check_back_space()
  local col = fn.col('.') - 1
  if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function show_documentation()
  local filetypes = { 'lua', 'help', 'vim' }
  local cw = fn.expand('<cword>')

  if fn.index(filetypes, vim.bo.filetype) >= 0 then
    cmd('h ' .. cw)
  elseif api.nvim_eval('coc#rpc#ready()') then
    fn.CocActionAsync('doHover')
  else
    cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

function _G.my_completion()
  local selected = fn.complete_info({'selected'})
  if selected ~= -1 then
    return '<C-y>'
  else
    return '<CR>'
  end
end

-- <CR> as completion trigger
U.g_map('i', '<CR>', 'pumvisible() ? complete_info()["selected"] != -1 ? "<C-y>" : "<CR>" : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', { expr = true })
-- Use TAB to select completion
U.g_map('i', '<TAB>', 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true })
U.g_map('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true })
-- Ctrl - space for getting available completion
U.g_map('i', '<C-space>', 'coc#refresh()', { expr = true })
-- hover or expand word
U.g_map('n', 'K', '<CMD>lua show_documentation()<CR>')
-- diagnostic mapping
U.g_map('n', ']g', '<Plug>(coc-diagnostic-next)', { noremap = false })
U.g_map('n', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = false })
-- goto code navigation
U.g_map('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
U.g_map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
U.g_map('n', 'gi', '<Plug>(coc-implementation)', { noremap = false })
U.g_map('n', 'gr', '<Plug>(coc-references)', { noremap = false })
-- rename symbol
U.g_map('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = false })
-- format
U.g_map('x', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })
U.g_map('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = false })
-- code action
U.g_map('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = false })
U.g_map('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = false })
U.g_map('n', '<leader>ac', '<Plug>(coc-codeaction)', { noremap = false })
-- quickfix
U.g_map('n', '<leader>qf', '<Plug>(coc-fix-current)', { noremap = false })
-- coc funcobj and classobj
U.g_map('x', ' if', '<Plug>(coc-funcobj-i)', { nowait = true, noremap = false })
U.g_map('n', ' if', '<Plug>(coc-funcobj-i)', { nowait = true, noremap = false })
U.g_map('x', ' af', '<Plug>(coc-funcobj-a)', { nowait = true, noremap = false })
U.g_map('n', ' af', '<Plug>(coc-funcobj-a)', { nowait = true, noremap = false })
U.g_map('x', ' ic', '<Plug>(coc-classobj-i)', { nowait = true, noremap = false })
U.g_map('n', ' ic', '<Plug>(coc-classobj-i)', { nowait = true, noremap = false })
U.g_map('x', ' ac', '<Plug>(coc-classobj-a)', { nowait = true, noremap = false })
U.g_map('n', ' ac', '<Plug>(coc-classobj-a)', { nowait = true, noremap = false })
-- float scroll
U.g_map('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { expr = true })
U.g_map('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { expr = true })
U.g_map('i', '<C-f>', 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(1)<CR>" : "<Right>"', { expr = true })
U.g_map('i', '<C-b>', 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(0)<CR>" : "<Left>"', { expr = true })
U.g_map('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { expr = true })
U.g_map('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { expr = true })

api.nvim_exec([[
autocmd FileType php let b:coc_pairs_disabled = ['<']
autocmd FileType vim let b:coc_pairs_disabled = ['"']

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]], '')
