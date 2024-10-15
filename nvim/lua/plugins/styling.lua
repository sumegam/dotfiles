return {
  -- Themes and styling
  {
    "navarasu/onedark.nvim",
    config = function(_, opts)
      vim.cmd [[colorscheme onedark]]
    end,
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = { '', '' },
        section_separators = { '', '' },
        disabled_filetypes = { }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          'filename',
          {
            'diagnostics',
	        sources = { 'nvim_diagnostic' }
          }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { },
        lualine_z = { }
      },
      tabline = { },
      extensions = { }
    }
  },
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },
}
