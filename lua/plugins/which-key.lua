return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    local which_key = require("which-key")

    which_key.setup({
      win = {
        border = "single",
      },
    })

    which_key.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>p", group = "Plugins" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Test" },
    })
  end,
  dependencies = {
    "echasnovski/mini.icons",
  },
}
