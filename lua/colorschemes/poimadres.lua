return {
  "olivercederborg/poimandres.nvim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("poimandres")

    require("colorschemes.customizations").apply()
  end,
}
