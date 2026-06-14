return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    vim.cmd.colorscheme("tokyonight-storm")

    local c = require("bootstrap.colors")
    local fn = vim.api.nvim_set_hl

    fn(0, "CursorLineNr", { fg = c.cyan_light })
    fn(0, "GitSignsAdd", { fg = c.cyan_light })
    fn(0, "GitSignsChange", { fg = c.blue })
    fn(0, "GitSignsDelete", { fg = c.fuksia })
    fn(0, "WinSeparator", { fg = c.cyan_light })
    fn(0, "Search", { fg = c.white, bg = c.fuksia })
  end,
  dependencies = {},
}
