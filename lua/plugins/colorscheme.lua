return {
  "folke/tokyonight.nvim",
  priority = 100,
  config = function()
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    -- local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"
    local grey_dark = "#111f33"
    local c = require("bootstrap.colors")

    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_float = bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        -- colors.bg_search = bg_search
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    })

    vim.cmd.colorscheme("tokyonight")

    vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = grey_dark })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.cyan_native })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.blue_light })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.fuksia })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = c.cyan_native, bg = c.cyan_native })
    vim.api.nvim_set_hl(0, "NoiceMini", { fg = c.cyan_light, bg = c.black_light, italic = true })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.cyan_light })
  end,

  dependencies = {
    "rktjmp/lush.nvim",
    -- "bluz71/vim-nightfly-colors",
    -- "olivercederborg/poimandres.nvim",
    -- "JoosepAlviste/palenightfall.nvim",
    -- "gbprod/nord.nvim",
    -- "oxfist/night-owl.nvim",
    -- "tiagovla/tokyodark.nvim",
    -- "embark-theme/vim",
    -- "cocopon/iceberg.vim",
    -- "haishanh/night-owl.vim",
    -- "gosukiwi/vim-atom-dark",
    -- "khaledgarbaya/night-owl-vim-theme",
  },
}
