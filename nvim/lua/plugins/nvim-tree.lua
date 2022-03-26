vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true})

vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.

--  Dictionary of buffer option names mapped to a list of option values that
--  indicates to the window picker that the buffer's window should not be
--  selectable.
vim.g.nvim_tree_special_files = { ["README.md"] = true, ["Makefile"] = true, ["MAKEFILE"] = true } --  List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
   git = 1,
   folders = 1,
   files = 1,
   folder_arrows = 1,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

--  default will show icon by default if no icon is provided
--  default shows no icon by default
vim.g.nvim_tree_icons = {
   default = '',
   symlink = '',
   git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
   },
   folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
   },
   lsp = {
   }
}


require('nvim-tree').setup {
	disable_netrw = false, -- disables netrw completely
	hijack_netrw = true, -- prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
	open_on_setup = false, -- opens the tree when typing `vim $DIR` or `vim`
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {},
	auto_close = true, -- closes the tree when it's the last window
  auto_reload_on_write = true,
	open_on_tab = false, -- open the tree when entering a new tab and the tree was previously open
	hijack_cursor = false, -- when moving cursor in the tree, will position the cursor at the start of the file on the current line
	update_cwd = false, -- update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
	diagnostics = {
		enable = true, -- show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
		icons = {
			hint = "",
			info = "",
     	 	warning = "",
     	 	error = "",
		},
	},
	update_focused_file = {
		enable = false, -- allows the cursor to be updated when entering a buffer
    update_cwd = false,
    ignore_list = {},
	},
	system_open = { -- configuration options for the system open command (`s` in the tree by default)
		cmd = nil,
		args = {}
	},
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
	view = {
		width = 40,
  	height = 30,
  	hide_root_folder = false,
  	side = 'left',
  	auto_resize = false,
  	mappings = {
    	custom_only = false,
		  list = {}
  	}
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
}
