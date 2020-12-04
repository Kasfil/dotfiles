vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function ()
  -- packer plugin management
  use {'wbthomason/packer.nvim', opt = true}
  -- neovim >= 0.5 plugins
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-treesitter/nvim-treesitter'
  -- use 'tjdevries/nlua.nvim'
  -- common neovim plugins
  -- productivity
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'scrooloose/nerdcommenter'
  use {'junegunn/fzf', run = ':call fzf#install()'}
  use 'junegunn/fzf.vim'
  use 'voldikss/vim-floaterm'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'honza/vim-snippets'
  use 'lambdalisue/gina.vim'
  use 'dense-analysis/ale'
  -- visual helper
  use 'yggdroot/indentline'
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
  use 'mhinz/vim-signify'
  use 'vim-airline/vim-airline'
  -- filetype improvement
  -- php in html
  use {'captbaritone/better-indent-support-for-php-with-html', ft = {'php'}}
  -- javascript
  use {'pangloss/vim-javascript', ft = {'javascript', 'javascript.jsx', 'typescript'}}
  -- miscellaneous
  use 'dstein64/vim-startuptime'
  use 'embear/vim-localvimrc'
  use 'editorconfig/editorconfig-vim'
  use 'sainnhe/sonokai'
end)
