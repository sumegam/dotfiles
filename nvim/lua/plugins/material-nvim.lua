-- Basic configuration of material theme
vim.g.material_style = 'deep ocean'
--vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('material').setup({
  contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},
	-- contrast = true,
	borders = false,
	italics = {
		comments = true,
		keywords = true,
		functions = true,
		variables = false,
		strings = false,
	},
	disable = {
		background = false,
	},
})

vim.cmd 'colorscheme material'
