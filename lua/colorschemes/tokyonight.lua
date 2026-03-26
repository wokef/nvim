local M = {}

function M.apply()
  local c = require("bootstrap.colorscheme").colors

  require("tokyonight").setup({
    style = "night",
    on_colors = function(colors)
      colors.bg = c.bg
      colors.bg_dark = c.bg_dark
      colors.bg_float = c.bg_dark
      colors.bg_highlight = c.highlight
      colors.bg_popup = c.bg_dark
      colors.bg_sidebar = c.bg_dark
      colors.bg_statusline = c.bg_dark
      colors.bg_visual = c.bg_visual
      colors.border = c.border
      colors.fg = c.fg
      colors.fg_dark = c.fg_dark
      colors.fg_float = c.fg
      colors.fg_gutter = c.fg_gutter
      colors.fg_sidebar = c.fg_dark
    end,
  })

  vim.cmd.colorscheme("tokyonight")

  require("colorschemes.customizations").apply()
end

return M
