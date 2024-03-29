require'nvim-treesitter.configs'.setup {
  -- Ensure that these language parsers are installed
  ensure_installed = {
    'python',
    'json',
    'lua',
    'html',
    'css',
    'javascript',
    'typescript',
    'comment',
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  -- Modules
  highlight = {
    enable = true,
    use_languagetree = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = { enable = true },
  matchup = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    navigation = {
      enable = true,
      keymaps = {
        goto_next_usage = 'gnu',
        goto_previous_usage = 'gpu'
      }
    }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

-- Set folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
