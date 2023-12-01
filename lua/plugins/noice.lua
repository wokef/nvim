return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = {
      view = false,
      view_error = false,
      view_warn = false,
      view_history = false,
      view_search = false,
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
