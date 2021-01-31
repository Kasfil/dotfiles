vim.cmd [[packadd packer.nvim]]

--[[
TODO:
- search for better colorscheme support
- configure plugins
- refer whats missing in old init.vim script
- discover new power of neovim 0.5

- missing plugins:
  - uppercase sql keyword

- incomfortable behaviiour:
  - missing fancy statusline (create your own if you have time)
--]]

return require('packer').startup(function(use)
  -- optionally manage packer.nvim
  use {'wbthomason/packer.nvim', opt = true}
  -- builtin neovim lsp & installer helper
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'anott03/nvim-lspinstall'
  -- comment helper
  use 'tomtom/tcomment_vim'
  -- git integration
  use 'lambdalisue/gina.vim'
  use 'mhinz/vim-signify'
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   }
  -- }
  -- Floating terminal
  use 'numtostr/FTerm.nvim'
  -- Editor config
  use 'editorconfig/editorconfig-vim'
  -- easy align
  use 'junegunn/vim-easy-align'
  -- Syntax highlights
  use 'sheerun/vim-polyglot'
  -- easy surround
  use 'tpope/vim-surround'
  -- treeview
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    cmd = 'MarkdownPreview',
    ft = { 'markdown' },
  }
  -- statusline
  use '~/github/nvim-hardline'
  -- use 'ojroques/nvim-hardline'
  -- use 'itchyny/lightline.vim'
  -- multiple cursor
  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
  -- bufkill, window, etc. helper
  use { 'ojroques/nvim-bufdel' }
  -- color preview
  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase'
  }
  -- motion
  use 'justinmk/vim-sneak'
  -- Filetype syntax hightlight enhacement
  use {
    'pangloss/vim-javascript',
    ft = { 'javascript' },
  }
  use {
    'herringtondarkholme/yats.vim',
    ft = { 'typescript' }
  }
  -- neovim theme
  use 'drewtempelmeyer/palenight.vim'
end)
