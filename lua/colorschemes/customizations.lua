local M = {}

function M.apply()
  local bg = "#011628"
  local bg_highlight = "#143652"
  local fg = "#CBE0F0"
  local grey_dark = "#111f33"
  local c = require("bootstrap.colors")

  vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
  vim.api.nvim_set_hl(0, "NormalNC", { fg = fg, bg = bg })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = bg_highlight })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = bg_highlight })

  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.cyan_native })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = grey_dark })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.cyan_native })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.blue_light })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.fuksia })
  vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = c.cyan_native, bg = c.cyan_native })
  vim.api.nvim_set_hl(0, "NoiceMini", { fg = c.cyan_light, bg = "", italic = true })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.cyan_light })
  vim.api.nvim_set_hl(0, "Search", { fg = c.white, bg = c.red_dark })
  vim.api.nvim_set_hl(0, "DashboardTitle", { fg = c.fuksia })
end

return M
