local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

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

o.background = 'dark'
o.hidden = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.wildignore = table.concat(wildignore, ',')
o.cmdheight = 2
o.fillchars = table.concat(fillchars, ',')
o.lazyredraw = true
o.showmatch = true
o.matchtime = 2
o.writebackup = false
o.swapfile = false
o.updatetime = 50
o.showmode = false
o.shortmess = o.shortmess .. 'c'
o.completeopt = table.concat(completeopt, ',')
o.shada = "!,'100,<50,s10,h,:1000,/1000"
o.splitright = true
o.splitbelow = true
o.pumblend = 15
o.inccommand = 'split'
o.errorbells = false

wo.number = true
wo.relativenumber = true
wo.scrolloff = 5
wo.sidescrolloff = 5
wo.foldmethod = 'manual'
wo.foldlevel = 3
wo.linebreak = true
wo.cursorline = true
wo.signcolumn = 'auto'

bo.expandtab = true
bo.tabstop = 2
bo.shiftwidth = 2
bo.formatoptions = 'crqwjp'
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.formatoptions = 'crqwjp'

-- api.nvim_set_option('syntax', 'ON')
cmd('syntax on')
cmd('filetype plugin on')
cmd('filetype indent on')

g.mapleader = ','

cmd([[au FocusGained,BufEnter * :checktime]])
cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
