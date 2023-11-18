vim.g.mapleader = " "

-- backup settings
vim.opt.backup = true
vim.opt.swapfile = true
vim.opt.writebackup = false

local backupDir = vim.fn.expand("$HOME/.backup")
vim.opt.backupdir = backupDir .. "/.backup" -- cidectory for backup file
vim.opt.directory = backupDir .. "/.backup" -- directory for temp file

-- vistual options
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.mouse = "n"
vim.opt.numberwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.so = 10 -- line at bottom of cursor line
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.scrolloff = 0
vim.opt.shiftwidth = 2
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.title = false
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.formatoptions = "jcoqlr"
vim.opt.colorcolumn = "80,120"
