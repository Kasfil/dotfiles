local U = require('utils')
local g = vim.g

g.NERDTreeQuitOnOpen = true
g.NERDTreeShowHidden = true
g.NERDTreeSortHiddenFirst = true
g.NERDTreeHijackNetrw = true
g.NERDTreeRespectWildIgnore = true
g.NERDTreeIgnore = { 'plugged[[dir]]', 'vendor[[dir]]', 'node_modules[[dir]]' }
g.NERDTreeWinPos = "right"
g.NERDTreeWinSize = 25
g.NERDTreeMinimalUI = true
g.NERDTreeMinimalMenu = true
g.NERDTreeAutoDeleteBuffer = true
g.NERDTreeDirArrowExpandable = "-"
g.NERDTreeDirArrowCollapsible = "+"

U.g_map('n', '<leader>nn', '<CMD>NERDTreeToggle<CR>')
