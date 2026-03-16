local M = {}

M.colors = {
  bg = "#011628",
  fg = "#565F89",
  highlight = "#143652",

  black = "#000b14",
  blue = "#5fafff",
  cyan = "#14dcd4",
  cyan_light = "#36f9f6",
  fuksia = "#ff007c",
  green = "#50fa7b",
  green_dark = "#9ece6a",
  grey = "#7da1c5",
  grey_light = "#c5cade",
  orange = "#ff8154",
  orange_light = "#ff9e64",
  pink = "#f797f7",
  pink_dark = "#f25e90",
  purple = "#baa6e3",
  purple_light = "#3d354a",
  red = "#db4b4b",
  red_dark = "#53143f",
  yellow = "#e5c07b",
  white = "#ffffff",
}

local c = M.colors

local status_bg = c.black

M.highlight = {
  Normal = { fg = c.fg, bg = c.bg },

  TabLine = { fg = c.grey_dark, bg = status_bg },
  BufferLineBufferSelected = { fg = c.white, bg = c.bg },
  BufferLineSeparatorSelected = { fg = status_bg, bg = c.bg },
  BufferLineSeparator = { bg = status_bg, fg = status_bg },
  BufferLineSeparatorVisible = { bg = status_bg, fg = status_bg },
  BufferLineCloseButtonSelected = { fg = c.fuksia, bg = c.bg },
  ColorColumn = { bg = c.grey_dark },
  CursorLine = { bg = c.highlight },
  CursorLineNr = { fg = c.cyan_light },
  DashboardTitle = { fg = c.fuksia },
  DiffAdd = { fg = c.cyan_light },
  DiffChange = { fg = c.blue },
  DiffDelete = { fg = c.fuksia },
  IndentBlanklineChar = { fg = c.cyan_light, bg = c.cyan_light },
  NoiceMini = { fg = c.cyan_light, italic = true },
  Search = { fg = c.white, bg = c.red_dark },
  WinSeparator = { fg = c.cyan_light },
  Keyword = { fg = c.pink_dark },
  Variable = { fg = c.orange_light },
  String = { fg = c.cyan },
  Type = { fg = c.cyan_light },
}

M.setup = function()
  -- vim.cmd("highlight clear")
  -- vim.cmd("syntax reset")

  local f = vim.api.nvim_set_hl

  for group, color in pairs(M.highlight) do
    f(0, group, color)
  end
end

return M
