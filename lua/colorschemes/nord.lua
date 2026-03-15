return {
  "shaunsingh/nord.nvim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("nord")

    require("colorschemes.customizations").apply()
  end,
}
