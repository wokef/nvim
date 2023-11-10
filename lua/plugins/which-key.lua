return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    local which_key = require("which-key")

    which_key.setup({
      window = {
        border = "single",
      },
    })

    which_key.register({
      f = { name = "Search" },
      g = { name = "Git" },
    }, {
      prefix = "<leader>",
    })
  end,
}
