local lspconfig = require'lspconfig'

local bufmapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true})
end

local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {
    {complete_items = {'buffers'}},
  },
}

local custom_on_attach = function(client)
  -- mapping for lsp
  bufmapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  bufmapper('n', 'gc', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  bufmapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bufmapper('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  bufmapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  bufmapper('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  bufmapper('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bufmapper('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  -- if filetype is not lua
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
    bufmapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end

  -- diagnostic maps
  bufmapper('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  bufmapper('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  bufmapper('n', '<space>ls', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

  -- lsp as omnifunc handler
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- completion attach
  require'completion'.on_attach(client, {
    matching_smart_case = true,
    enable_snippet = 'vim-vsnip',
    matching_strategy_list = {'exact', 'substring', 'fuzzy'},
    chain_complete_list = chain_complete_list,
  })
end

-- sumneko lua
lspconfig.sumneko_lua.setup{
  cmd = {
    "/home/kasf/repos/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    "-e",
    "LANG=\"en_us\"",
    "/home/kasf/repos/lua-language-server/main.lua",
  },
  on_attach = custom_on_attach,
  settings = {
    Lua = {
      workspace = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
      diagnostics = {
        globals = {'vim', 'use'},
        disable = {'lowercase-global', 'unused-function'},
      },
    },
  },
}

-- tjdevries nlua
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
  -- on_attach = custom_on_attach,
  -- globals = {'use'},
-- })

lspconfig.intelephense.setup{
  cmd = {"/home/kasf/.npm-global/bin/intelephense", "--stdout"},
  settings = {
    intelephense = {
      environment = {
        phpVersion = '7.4',
      },
    },
  },
  on_attach = custom_on_attach,
}

lspconfig.gopls.setup{on_attach = custom_on_attach}
lspconfig.html.setup{on_attach = custom_on_attach}
lspconfig.jedi_language_server.setup{on_attach = custom_on_attach}
lspconfig.tsserver.setup{on_attach = custom_on_attach}

-- Neovim Diagnostic configuration
-- already merged to Neovim master branch 0.5
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = ' ',
    },
    signs = true,
    update_in_insert = true,
  }
)
