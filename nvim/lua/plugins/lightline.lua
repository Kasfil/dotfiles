vim.g.lightline = {
  colorscheme = 'sonokai',
  separator = { left = '', right = ''},
  subseparator = { left = '', right = ''},
  active = {
    left = {
      { 'mode', 'paste' },
      { 'readonly', 'ginaBranch', 'signify' },
      { 'filename', 'modified', 'cocmessages' }
    },
    right = {
      { 'lineinfo', 'percent', 'diagnosticInfo' },
      { 'filetype' },
      { 'fileformat', 'fileencoding' }
    },
  },
  component_expand = {
    diagnosticInfo = 'StatusDiagnostic',
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
