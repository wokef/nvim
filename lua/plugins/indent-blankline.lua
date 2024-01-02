local icons = require("bootstrap.icons")

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = icons.lineLeft,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = {
      enabled = true,
      show_exact_scope = true,
    },
    exclude = {
      filetypes = { "NvimTree", "Trouble" },
    },
  },
}
