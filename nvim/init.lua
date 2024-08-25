-- This is my neovim config.
-- There are many like it, but this one is mine.

-- Imagine not using space as your leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Hybrid relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Accentuate the current line number
vim.opt.cursorline = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function (ev)
    save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- C-n and C-p to cycle tabs
vim.cmd([[
  nnoremap <C-p> gT
  nnoremap <C-n> gt
]])

-- Press Esc to remove search highlight
vim.cmd("nnoremap <silent> <esc> :noh<cr><esc>")

--
-- Dependencies
--

-- Clone mini.nvim manually in a way that it gets managed by mini.deps
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up mini.deps
require('mini.deps').setup({ path = { package = path_package } })

-- Colorscheme
MiniDeps.add('ellisonleao/gruvbox.nvim')
require("gruvbox").setup({
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  }
})
vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- Telescope
MiniDeps.add({
  source = 'nvim-telescope/telescope.nvim',
  depends = { 'nvim-lua/plenary.nvim' },
})
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>t', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>g', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

-- Treesitter
MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

-- vim-sleuth
MiniDeps.add('tpope/vim-sleuth')

-- Gitsigns
MiniDeps.add('lewis6991/gitsigns.nvim')
require('gitsigns').setup()
