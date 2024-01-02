return {
  "folke/tokyonight.nvim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("tokyonight")

    local c = require("bootstrap.colors")

    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = c.cyan_native })
    vim.api.nvim_set_hl(0, "AlphaFooter", { link = "Boolean" })
    -- vim.api.nvim_set_hl(0, "ColorColumn", { bg = c.red_dark })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.cyan_light })

    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.cyan_native })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.blue_light })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.fuksia })

    vim.api.nvim_set_hl(0, "NoiceMini", { fg = c.cyan_light, bg = c.black_light, italic = true })
  end,
}
