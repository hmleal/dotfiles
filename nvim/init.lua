vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')

vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.colorcolumn = "80,120"

vim.keymap.set('n', '<Leader>h', ':split<CR>')
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>q', ':bp<CR>')
vim.keymap.set('n', '<leader>w', ':bp<CR>')
vim.keymap.set('n', '<leader>c', ':bd<CR>')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require('lazy').setup('plugins', opts)
