return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    vim.cmd.colorscheme("tokyonight-storm")
  end,
  dependencies = {
    "folke/tokyonight.nvim",
  },
}
