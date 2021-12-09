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

  -- Fuzzy search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Themes and styling
  -- use 'marko-cerovac/material.nvim'
  use 'navarasu/onedark.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Trouble for prettier diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- For commenting out code
  use "b3nj5m1n/kommentary"

  -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Auto pairs
  use "steelsojka/pears.nvim"

  -- Indentation guide
  use "lukas-reineke/indent-blankline.nvim"

  -- Markdown
  use { -- Markdown preview plugin for (neo)vim
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
    cmd = 'MarkdownPreview'
  }
end)
