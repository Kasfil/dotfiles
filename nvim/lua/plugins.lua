vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function ()
  -- packer plugin management
  use {'wbthomason/packer.nvim', opt = true}

  --[[
    fallback to non build in lsp and not using treesitter
    the reason is issue i faced and make me uncomfortable
    to use the plugin for daily, someday when it's ready
    for daily usage will switch back to this.
  --]]
  -- neovim >= 0.5 plugins
  -- use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'
  -- use 'nvim-lua/lsp-status.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- lsp
  use {'neoclide/coc.nvim', branch = 'release'}

  -- productivity
  use 'tpope/vim-surround'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'scrooloose/nerdcommenter'
  use 'easymotion/vim-easymotion'
  use 'voldikss/vim-floaterm'

  -- finder
  use {'junegunn/fzf.vim', requires = {
      {'junegunn/fzf', run = './install --bin', opt = true}
  }}

  -- git integration
  use 'lambdalisue/gina.vim'
  use 'mhinz/vim-signify'

  -- visual helper
  use 'yggdroot/indentline'
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
  use {'preservim/nerdtree', cmd = 'NERDTreeToggle'}
  use {'ryanoasis/vim-devicons', cmd = 'NERDTreeToggle'}
  use 'vim-airline/vim-airline'

  -- filetype improvement
  -- general
  use 'sheerun/vim-polyglot'
  -- php in html
  use {'captbaritone/better-indent-support-for-php-with-html', ft = {'php'}}
  -- javascript
  use {'pangloss/vim-javascript', ft = {'javascript', 'javascript.jsx', 'typescript'}}
  use {'leafgarland/typescript-vim', ft = {'typescript'}}
  -- handlebar
  use {'mustache/vim-mustache-handlebars', ft = {'hbs'}}
  -- lua
  use {'euclidianace/betterlua.vim', ft = {'lua'}}
  -- sql
  use {'jsborjesson/vim-uppercase-sql', ft = {'sql'}}

  -- utils
  use 'norcalli/nvim_utils'

  -- snippets
  use 'honza/vim-snippets'

  -- miscellaneous
  use 'bronson/vim-trailing-whitespace'
  use 'dstein64/vim-startuptime'
  use 'junegunn/vim-easy-align'
  use 'editorconfig/editorconfig-vim'
  use 'sainnhe/sonokai'
end)
