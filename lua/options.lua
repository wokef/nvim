-- backup settings
vim.o.backup = true
vim.opt.swapfile = true
vim.opt.writebackup = false

local backupDir = vim.fn.expand("$HOME/.backup")
vim.o.backupdir = backupDir .. "/.backup" -- cidectory for backup file
vim.o.directory = backupDir .. "/.backup" -- directory for temp file

-- vistual options
vim.o.foldenable = false
vim.o.foldmethod = "indent"
vim.o.mouse = "n"
vim.o.numberwidth = 4
vim.o.relativenumber = true
vim.o.smarttab = true
vim.o.so = 10 -- line at bottom of cursor line
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.wrap = false
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.scrolloff = 0
vim.opt.shiftwidth = 2
vim.opt.showcmd = false
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
