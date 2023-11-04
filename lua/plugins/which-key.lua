return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    require("which-key").register({
      f = { name = "Search" },
      g = { name = "Git" },
    }, {
      prefix = "<leader>",
    })
  end,
}
