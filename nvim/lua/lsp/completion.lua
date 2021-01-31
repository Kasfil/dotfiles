local utils = require 'utils'

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = true,
  preselect = 'disable',
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
  }
}

utils.g_map('n', '<C-Space>', 'compe#complete()', { expr = true })
utils.g_map('n', '<CR>', 'compe#confirm("<CR>")', { expr = true })
