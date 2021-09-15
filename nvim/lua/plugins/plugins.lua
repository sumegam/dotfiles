-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim' -- Lsp signature hint when you type

  -- Autocompletion
  use 'hrsh7th/nvim-compe'

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate'
  }

  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Themes and styling
  use 'marko-cerovac/material.nvim'
  use {
	'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Trouble for prettier diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
end)
