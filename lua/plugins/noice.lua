return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = {
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "mini",
    },
    lsp = {
      progress = { enabled = false },
      hover = { enabled = false },
      signature = { enabled = false },
      message = { enabled = false },
      documentation = { enabled = false },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
