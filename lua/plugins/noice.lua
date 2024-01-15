return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = {
      enabled = false,
      view = "cmdline",
      view_error = "cmdline",
      view_warn = "cmdline",
      view_history = "messages",
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
