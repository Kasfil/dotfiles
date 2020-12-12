<h2 align="center">Neovim Configuration</h2>

There are 2 main configuration file here:

    1. `old.vim` intended for Neovim <= 0.4.X
        - plugin manager by [vim-plug](https://github.com/junegunn/vim-plug)
        - completion by awesome plugin [coc.nvim](https://github.com/neoclide/coc.nvim)
        - and more awesome plugin inside

    2. `init.lua` doesn't perfect yet for current workflow.
        but this file is intended for neovim >= 0.5.0, this file
        use the 0.5.0 features.
        - plugin manager ny [packer.nvim](https://github.com/wbthomason/packer.nvim)
        - completion is combination of:
            a. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
            b. [completion-nvim](https://github.com/nvim-lua/completion-nvim)
        - almost every plugins in `old.vim`
