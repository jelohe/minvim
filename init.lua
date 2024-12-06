-- Pluging manager
local install_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        'curl', '-fLo', install_path, '--create-dirs',
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    })
    vim.cmd([[autocmd VimEnter * PlugInstall --sync | source $MYVIMRC]])
end

-- Plugins
vim.cmd [[
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'stevearc/oil.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
call plug#end() ]]

-- Plugin config
require('oil').setup()
local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
require"telescope".setup({defaults={mappings={i={["<esc>"]=actions.close}}}})

-- Colors
vim.cmd [[colorscheme base16-grayscale-dark]]

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
