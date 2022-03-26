require("indent_blankline").setup {
	char = '│',
	filetype_exclude = { 'help', 'terminal', 'dashboard' },
    buftype_exclude = { 'terminal' },
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
    show_current_context = false,
	show_end_of_line = false,
}
