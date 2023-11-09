vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 100 })
  end,
})
