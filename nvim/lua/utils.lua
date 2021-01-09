local api = vim.api
local U = {}

function U.g_map(mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    noremap = true,
    silent = true,
    expr = false
  })

  api.nvim_set_keymap(mode, key, result, opts)
end

function U.b_map(buff, mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    noremap = true,
    silent = true,
    expr = false
  })

  api.nvim_buf_set_keymap(buff, mode, key, result, opts)
end

return U
