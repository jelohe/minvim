-- Plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('chriskempson/base16-vim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-commentary')
Plug('stevearc/oil.nvim')
vim.call('plug#end')

-- Plugin config
local status_ok, oil = pcall(require, 'oil')
if not status_ok then return end -- No plugins, exit

oil.setup()
local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
require"telescope".setup({defaults={mappings={i={["<esc>"]=actions.close}}}})

-- Colors
vim.cmd('silent! colorscheme base16-grayscale-dark')

-- Mappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<enter>', ':')
vim.keymap.set('n', '<tab>', '<c-^><cr>')
vim.keymap.set({'n','i'}, '<c-s>', '<esc>:w<cr>')
vim.keymap.set('n', '<leader>l', function() vim.wo.number = not vim.wo.number end)
vim.keymap.set('n', '<leader> ', telescope.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>f', telescope.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>g', telescope.live_grep, { desc = 'Search' })
vim.keymap.set('n', '<leader>*', telescope.grep_string, { desc = 'Search this' })
vim.keymap.set('n', '<leader>?', telescope.help_tags, { desc = 'Help' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Manage files' })

-- Defaults
vim.o.hlsearch = false
vim.o.clipboard = vim.fn.has('unnamedplus') == 1 and 'unnamedplus' or ''
