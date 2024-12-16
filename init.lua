--
-- Plugins
--
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('zenbones-theme/zenbones.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-commentary')
Plug('stevearc/oil.nvim')
vim.call('plug#end')

--
-- Plugin config
--
local status_ok, oil = pcall(require, 'oil')
if not status_ok then return end -- No plugins, exit

oil.setup()
local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
require'telescope'.setup({
    defaults={
      mappings={i={['<esc>']=actions.close}},
      layout_strategy='flex',
    },
})
require'lualine'.setup({
	options = { section_separators = '', component_separators = '' },
	theme = 'tokyobones',
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {'progress'},
		lualine_z = {'location'},
	},
  extensions = {'oil'}
})

--
-- Colors
--
vim.opt.background='dark'
vim.g.bones_compat=1
vim.cmd('colorscheme tokyobones')

--
-- Mappings
--
local function tab_or_complete()
  local col = vim.fn.col(".") - 1
  local line = vim.fn.getline(".")

  if col > 0 and line:sub(col, col):match("%w") then
    return vim.api.nvim_replace_termcodes("<C-N>", true, true, true)
  else
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
  end
end
vim.keymap.set("i", "<tab>", function() return tab_or_complete() end, { expr = true })
vim.g.mapleader = ' '
vim.keymap.set('n', '<enter>', ':')
-- navigation
vim.keymap.set('n', '<tab>', '<c-^><cr>')
vim.keymap.set({'n','i'}, '<c-s>', '<esc>:w<cr>')
vim.keymap.set({'n','i'}, '<c-h>', '<esc><c-w>h')
vim.keymap.set({'n','i'}, '<c-j>', '<esc><c-w>j')
vim.keymap.set({'n','i'}, '<c-k>', '<esc><c-w>k')
vim.keymap.set({'n','i'}, '<c-l>', '<esc><c-w>l')
vim.keymap.set('n', '<leader>q', function() vim.cmd([[bd]]) end)
vim.keymap.set('n', '<leader>Q', function() vim.cmd([[bufdo bd]]) end)
vim.keymap.set('n', '<leader>z', function() vim.cmd([[tabe %]]) end)
vim.keymap.set('n', '<leader>Z', function() vim.cmd([[q]]) end)
-- clear Güindous newlines (useful when pasting text on WSL)
vim.keymap.set('n', '<leader>p', function() vim.cmd([[%s/\r//g]]) end)
-- config
vim.keymap.set('n', '<leader>ce', function() vim.cmd([[tabedit $MYVIMRC]]) end)
vim.keymap.set('n', '<leader>cs', function() vim.cmd([[source $MYVIMRC]]) end)
vim.keymap.set('n', '<leader>l', function() vim.wo.number = not vim.wo.number end)
-- plugin maps
vim.keymap.set('n', '<leader> ', telescope.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>f', telescope.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>r', telescope.live_grep, { desc = 'Search' })
vim.keymap.set('n', '<leader>h', telescope.help_tags, { desc = 'Help' })
vim.keymap.set('n', '<leader>*', telescope.grep_string, { desc = 'Search this' })
vim.keymap.set('n', '<leader>?', telescope.help_tags, { desc = 'Help' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Manage files' })

--
-- Defaults
--
vim.o.clipboard = vim.fn.has('unnamedplus') == 1 and 'unnamedplus' or ''
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
