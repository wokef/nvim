return {
  "rktjmp/lush.nvim",
  priority = 1000,
  config = function()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    -- vim.cmd.colorscheme("catppuccin-frappe")
    -- vim.cmd.colorscheme("catppuccin-latte")
    -- vim.cmd.colorscheme("catppuccin-macchiato")
    -- vim.cmd.colorscheme("catppuccin-mocha")
    -- vim.cmd.colorscheme("dracula")
    -- vim.cmd.colorscheme("eldritch")
    -- vim.cmd.colorscheme("fluoromachine")
    -- vim.cmd.colorscheme("kanagawa")
    -- vim.cmd.colorscheme("monokai")
    -- vim.cmd.colorscheme("moonlight")
    -- vim.cmd.colorscheme("nightfox")
    -- vim.cmd.colorscheme("nord")
    -- vim.cmd.colorscheme("oldworld")
    -- vim.cmd.colorscheme("oh-lucy")
    -- vim.cmd.colorscheme("poimandres")
    -- vim.cmd.colorscheme("rose-pine")
    -- vim.cmd.colorscheme("solarized-osaka")
    -- vim.cmd.colorscheme("tokyodark")

    -- vim.cmd.colorscheme("tokyonight-day")
    -- vim.cmd.colorscheme("tokyonight-moon")
    -- vim.cmd.colorscheme("tokyonight-night")
    -- vim.cmd.colorscheme("tokyonight-storm")

    -- require("colorschemes.tokyonight").apply()
    -- require("colorschemes.customizations").apply()
  end,
  dependencies = {
    "EdenEast/nightfox.nvim",
    "Mofiqul/dracula.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "dgox16/oldworld.nvim",
    "folke/tokyonight.nvim",
    "maxmx03/fluoromachine.nvim",
    "olivercederborg/poimandres.nvim",
    "rebelot/kanagawa.nvim",
    "shaunsingh/moonlight.nvim",
    "shaunsingh/nord.nvim",
    "tanvirtin/monokai.nvim",
    "Yazeed1s/oh-lucy.nvim",
    "craftzdog/solarized-osaka.nvim",
    "tiagovla/tokyodark.nvim",
    "eldritch-theme/eldritch.nvim",
    "rose-pine/neovim",
  },
}
