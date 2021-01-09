require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'typescript', 'c', 'php', 'javascript', 'json', 'jsdoc', 'lua', 'html', 'css', 'python', 'go' },
  highlight = {enable = true},
  incremental_selection = {enable = true},
  -- indent = {enable = true}
}
