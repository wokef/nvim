return {
  "rktjmp/lush.nvim",
  priority = 100,
  config = function()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    -- vim.cmd.colorscheme("catppuccin")
    -- vim.cmd.colorscheme("dracula")
    -- vim.cmd.colorscheme("fluoromachine")
    -- vim.cmd.colorscheme("kanagawa")
    -- vim.cmd.colorscheme("monokai")
    -- vim.cmd.colorscheme("moonlight")
    -- vim.cmd.colorscheme("nightfox")
    -- vim.cmd.colorscheme("nord")
    -- vim.cmd.colorscheme("oldworld")
    -- vim.cmd.colorscheme("oh-lucy")
    -- vim.cmd.colorscheme("poimandres")
    -- vim.cmd.colorscheme("tokyonight")

    -- require("colorschemes.customizations").apply()
    require("colorschemes.tokyonight").apply()
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
  },
}
