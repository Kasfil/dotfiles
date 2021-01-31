vim.cmd([[
function! DiagnosticInfo()
  return v:lua.DiagnosticsInfoStatusLine()
endfunction
]])

vim.g.lightline = {
  colorscheme = 'palenight',
  separator = { left = '', right = ''},
  subseparator = { left = '', right = ''},
  active = {
    left = {
      { 'mode', 'paste' },
      { 'readonly', 'ginaBranch' },
      { 'filename', 'modified' }
    },
    right = {
      { 'lineinfo', 'percent' },
      { 'diagnosticInfo', 'filetype' },
      { 'fileformat', 'fileencoding' }
    },
  },
  component_expand = {
    diagnosticInfo = 'DiagnosticInfo',
  },
  component_function = {
    signify = 'sy#repo#get_stats_decorated',
    ginaBranch = 'gina#component#repo#branch',
    cocmessages = 'CocMessages',
  },
  component_type = {
    diagnosticInfo = 'error'
  },
}
