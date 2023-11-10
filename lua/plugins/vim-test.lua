return {
  "vim-test/vim-test",
  cmd = { "TestFile", "TestNearest" },
  init = function()
    vim.cmd([[let test#strategy = 'toggleterm']])
    vim.cmd([[let test#php#phpunit#executable = 'supa test']])
  end,
}
