-- this file contains core settings

-- disable netrw at the very start of your init.lua
-- so that it doesn't interfere with nvim-tree which is a plugin we use
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- The "<leader>" key is now mapped to " "
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Increase mapped sequence wait time, because i am slow, default is 1000ms
vim.opt.timeoutlen = 1500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', lead = '·', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- setting up msys2 so that commands executed with :! use it as shell
-- for that we also need to make sure it uses the correct .profile and .bashrc so we set home and pass --login
-- the following are to use msys64 as shell
vim.env.HOME = 'C:/msys64/home/marti'
vim.opt.shell = '"C:/msys64/usr/bin/bash.exe" --login'
vim.opt.shellcmdflag = '-c'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

-- the following are to use ubuntu (wls) shell
-- vim.opt.shell = 'ubuntu.exe'
-- vim.opt.shellcmdflag = '-c'
-- vim.opt.shellquote = ''
-- vim.opt.shellxquote = ''

