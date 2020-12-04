local wildignore = {
  -- file to ignore
  '*.o',
  '*~',
  '*.pyc',
  -- Directory to ignore
  '*/.git/*',
  '*/.hg/*',
  '*/.svn/*',
  '*/.DS_Store',
  'node_modules/'
}

local completeopt = {
  'menuone',
  'noinsert',
  'noselect',
}

local fillchars = {
  'eob: ',
  'vert:║'
}

vim.o.background = 'dark'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.wildignore = table.concat(wildignore, ',')
vim.o.cmdheight = 2
vim.o.fillchars = table.concat(fillchars, ',')
vim.o.lazyredraw = true
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 150
vim.o.showmode = false
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = table.concat(completeopt, ',')
vim.o.shada = "!,'100,<50,s10,h,:1000,/1000"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.pumblend = 15
vim.o.inccommand = 'split'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.scrolloff = 5
vim.wo.sidescrolloff = 5
vim.wo.foldmethod = 'manual'
vim.wo.foldlevel = 3
vim.wo.linebreak = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'auto'

local formatopt = {
  'c', 'r', 'q', 'w', 'j', 'p',
}

vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.formatoptions = 'crqwjp'
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.formatoptions = table.concat(formatopt, ',')

-- vim.api.nvim_set_option('syntax', 'ON')
vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

vim.g.mapleader = ','

vim.cmd([[au FocusGained,BufEnter * :checktime]])

require 'plugins'
require 'lsp'
require 'treesitter'
require 'variables'
require 'keymaps'

vim.cmd('colorscheme sonokai')
