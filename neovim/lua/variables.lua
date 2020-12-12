-- sonokai theme variable config
vim.api.nvim_set_var('sonokai_style', 'atlantis')
vim.api.nvim_set_var('sonokai_enable_italic', true)
vim.api.nvim_set_var('sonokai_transparent_background', true)

-- easymotion
vim.api.nvim_set_var('EasyMotion_do_mapping', false)
vim.api.nvim_set_var('EasyMotion_smartcase', true)

-- NerdCommenter
vim.api.nvim_set_var('NERDSpaceDelims', 1)

-- fzf-vim
local fzf_window = {
  window = {
    width = 0.9,
    height = 0.8,
  },
}

vim.api.nvim_set_var('fzf_preview_window', {'right:50%'})
vim.api.nvim_set_var('fzf_layout', fzf_window)
vim.api.nvim_set_var('fzf_colors', { border = { 'fg', 'keyword' }})

-- localvimrc
vim.api.nvim_set_var('localvimrc_name', '.vim/lvimrc')

-- floaterm-vim
-- floaterm-vim mapping
vim.api.nvim_set_var('floaterm_keymap_new', '<F7>')
vim.api.nvim_set_var('floaterm_keymap_prev', '<F8>')
vim.api.nvim_set_var('floaterm_keymap_next', '<F9>')
vim.api.nvim_set_var('floaterm_keymap_toggle', '<F12>')
-- floaterm-vim ui
vim.api.nvim_set_var('floaterm_width', 0.9)
vim.api.nvim_set_var('floaterm_height', 0.8)
vim.api.nvim_set_var('floaterm_autoclose', true)

-- ale-vim
vim.api.nvim_set_var('ale_virtualtext_cursor', true)
vim.api.nvim_set_var('ale_virtualtext_prefix', '  ')
vim.api.nvim_set_var('ale_fix_on_save', true)

local linters = {
  javascript = {'eslint'},
  python = {'pylint'},
  php = {'phpcs'},
}
local fixers = {
  javascript = {'prettier'},
  css = {'prettier'},
  html = {'prettier'},
  php = {'phpcbf'},
}
vim.api.nvim_set_var('ale_linters', linters)
vim.api.nvim_set_var('ale_fixers', fixers)

-- completion-nvim
vim.api.nvim_set_var('completion_enable_snippet', 'vim-vsnip')

-- airline
vim.api.nvim_set_var('airline_theme', 'sonokai')

-- vsnip
local vsnip = {
  javascript = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  typescript = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
}
vim.api.nvim_set_var('vsnip_filetypes', vsnip)
