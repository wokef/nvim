return {
  "vim-test/vim-test",
  cmd = { "TestFile", "TestNearest" },
  init = function()
    vim.g["test#strategy"] = "toggleterm"

    vim.g["test#custom_runners"] = { PHP = { "Artisan" } }
    vim.g["test#php#runner"] = "artisan"
  end,
}
