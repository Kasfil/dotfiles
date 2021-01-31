vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 5,
      prefix = ' ',
    },
    signs = true,
    update_in_insert = false,
  }
)

vim.cmd(
[[
hi LspDiagnosticsVirtualTextError guifg=red
hi LspDiagnosticsVirtualTextWarning guifg=yellow
hi LspDiagnosticsVirtualTextInformation guifg=blue
hi LspDiagnosticsVirtualTextError guifg=blue

echo 'highlights changed'
]]
)
