vim.lsp.set_log_level("debug")

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg='#3E4452'
      hi LspReferenceText cterm=bold ctermbg=red guibg='#3E4452'
      hi LspReferenceWrite cterm=bold ctermbg=red guibg='#3E4452'
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- diagnosticls
nvim_lsp.diagnosticls.setup {
  command = { 'diagnostic-languageserver', '--stdio', },
  filetypes = { 'typescript', 'javascript', 'python', 'go', 'php' },
  initializationOptions = {
    linters = {
      eslint = {
        sourceName = 'eslint',
        command = './node_modules/.bin/eslint',
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json',
        },
        debounce = 100,
        rootPatterns = {
          '.git',
          'package.json',
        },
        parseJson = {
          errorsRoot = '[0].message',
          line = 'line',
          column = 'column',
          endline = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity',
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      pylint = {
        sourceName = 'pylint',
        command = 'pylint',
        args = {
          '--output-format',
          'text',
          '--score',
          'no',
          '--msg-template',
          '"{line}:{column}:{category}:{msg} ({msg_id}:{symbol})"',
          '$file',
        },
        formatPattern = {
          '^(\\d+?):(\\d+?):([a-z]+?):(.*)$',
          {
            line = 1,
            column = 2,
            security = 3,
            message = 4
          }
        },
        rootPatterns = { '.git', 'pyproject.toml', 'setup.py' },
        securities = {
          informational = 'hint',
          refactor = 'info',
          convention = 'info',
          warning = 'warning',
          error = 'error',
          fatal = 'error',
        },
        offsetColumn = 1,
        formatLines = 1,
      },
      phpcs = {
        sourceName = 'phpcs',
        debounce = 100,
        command = './vendor/bin/phpcs',
        args = {
          '--report=emacs',
          '-s',
          '-',
        },
        formatPattern = {
          '^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)(\\r|\\n)*$',
          {
            line =  1,
            column = 2,
            message = 4,
            security = 3
          },
        },
        rootPatterns = { 'composer.json', 'composer.lock', 'vendor', '.git' },
        securities = {
          error = 'error',
          warning = 'warning',
        },
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
      },
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint',
      php = 'phpcs',
      python = 'pylint',
    },
    formatters = {},
    formatFiletypes = {},
  },
}

-- lua language server
local sumneko_root_path = '/home/kasf/github/lua-language-server/'
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {
    sumneko_root_path .. 'bin/Linux/lua-language-server',
    '-E',
    sumneko_root_path .. 'main.lua'
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

-- tsserver
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
}

-- intelephense
nvim_lsp.intelephense.setup {
  on_attach = on_attach,
}

-- gopls
nvim_lsp.gopls.setup {
  on_attach = on_attach,
}

-- jsonls
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
}
