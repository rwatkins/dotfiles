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

-- Basic tab stuff to avoid tab characters
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

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
