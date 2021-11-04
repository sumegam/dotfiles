-- Basic configuration of material theme
vim.g.material_style = 'deep ocean'
--vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('material').setup({
	contrast = true,
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

vim.cmd[[colorscheme material]]
