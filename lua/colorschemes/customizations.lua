local M = {}

function M.apply()
  local c = require("bootstrap.colorscheme").colors

  vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = c.bg_highlight })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = c.bg_highlight })

  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.cyan_light })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = c.grey_dark })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.cyan_light })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.blue_light })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.fuksia })
  vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = c.cyan_light, bg = c.cyan_light })
  vim.api.nvim_set_hl(0, "NoiceMini", { fg = c.cyan_light, bg = "", italic = true })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.cyan_light })
  vim.api.nvim_set_hl(0, "Search", { fg = c.white, bg = c.red_dark })
  vim.api.nvim_set_hl(0, "DashboardTitle", { fg = c.fuksia })
end

return M
