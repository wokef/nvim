return {
  "gbprod/nord.nvim",
  priority = 100,
  config = function()
    require("nord").setup({ transparent = true })
    vim.cmd.colorscheme("nord")

    local c = require("bootstrap.colors")

    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = c.cyan_native })
    vim.api.nvim_set_hl(0, "AlphaFooter", { link = "Boolean" })
    -- vim.api.nvim_set_hl(0, "ColorColumn", { bg = c.red_dark })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.cyan_light })
  end,
}
