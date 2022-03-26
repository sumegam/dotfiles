-- General file configuration
vim.opt.encoding = 'utf-8'

-- Set line numbering
vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * if !(&ft ==? "NvimTree") | set number relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]]

-- Syntax highlighting
vim.opt.syntax = 'on'

-- No search highlighting
vim.opt.hlsearch = false

-- Ignore case
vim.opt.ignorecase = true

-- Clipboard
vim.opt.clipboard = 'unnamed,unnamedplus'

-- Term GUI colors
vim.opt.termguicolors = true

-- Tab line
vim.opt.showtabline = 2

-- Keybindings
--
-- Navigation in split windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })

-- Tab navigation
vim.api.nvim_set_keymap('n', '<A-l>', 'gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', 'gT', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-l>', ':tabm +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-h>', ':tabm -1<CR>', { noremap = true, silent = true })
