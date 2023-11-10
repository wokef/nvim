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
      b = { name = "Buffer" },
      g = { name = "Git" },
      l = { name = "LSP" },
      p = { name = "Plugins" },
      s = { name = "Search" },
    }, {
      prefix = "<leader>",
    })
  end,
}
