vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 100 })
  end,
})

vim.api.nvim_command([[cabbrev fly set foldenable<BAR>set foldmethod "indent"]])
vim.api.nvim_command([[cabbrev fln set nofoldenable]])

vim.api.nvim_create_user_command("BufferKill", function()
  require("bootstrap.common").buf_kill("bd")
end, {})

vim.api.nvim_create_user_command("LazyGit", function()
  require("bootstrap.common").lazy_git()
end, {})

vim.api.nvim_create_user_command("ClearLogs", function()
  require("bootstrap.common").clear_logs()
end, {})

vim.api.nvim_command([[set clipboard+=unnamedplus]])
