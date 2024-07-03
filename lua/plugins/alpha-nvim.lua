return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("bootstrap.icons")
    local colors = require("bootstrap.colors")
    local dashboard = require("alpha.themes.dashboard")

    vim.api.nvim_set_hl(0, "DashboardL1", { fg = colors.yellow_dark })
    vim.api.nvim_set_hl(0, "DashboardL2", { fg = colors.cyan_light })
    vim.api.nvim_set_hl(0, "DashboardL3", { fg = colors.cyan_native })
    vim.api.nvim_set_hl(0, "DashboardL4", { fg = colors.fuksia })

    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = "             ▖     ",
        opts = { hl = "DashboardL1", position = "center" },
      },
      {
        type = "text",
        val = "┌─╮╭─╮╭─╮▖  ▖▖▄▄▗▄ ",
        opts = { hl = "DashboardL2", position = "center" },
      },
      {
        type = "text",
        val = "│ │├─┘│ │▝▖▞ ▌▌ ▌ ▌",
        opts = { hl = "DashboardL3", position = "center" },
      },
      {
        type = "text",
        val = "╵ ╵╰─╯╰─╯ ▝  ▘▘ ▘ ▘",
        opts = { hl = "DashboardL4", position = "center" },
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", icons.files.new .. " New File", "<cmd>ene<CR>"),
      dashboard.button("f", icons.files.find .. " Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("t", icons.search .. " Find Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("P", icons.projects .. " Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("p", icons.download .. " Plugins manager", "<cmd>Lazy<CR>"),
      dashboard.button("m", icons.target .. "  Lsp manager", "<cmd>Mason<CR>"),
      dashboard.button("c", icons.half_life .. " Configuration", "<cmd>e $MYVIMRC<BAR>cd $HOME/.config/nvim<CR>"),
      dashboard.button("g", icons.github .. " Lazy Git", "<cmd>LazyGit<CR>"),
      dashboard.button("d", icons.database .. " DB UI", "<cmd>DBUI<CR><cmd>on<CR>"),
      dashboard.button("N", icons.note .. " Obsidian Note Keeper", "<cmd>ObsidianSearch<CR>"),
      dashboard.button("q", icons.close .. " Quit", "<cmd>qa<CR>"),
    }

    require("alpha").setup(dashboard.opts)
  end,
}
