return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("bootstrap.icons")
    local colors = require("bootstrap.colors")
    local dashboard = require("alpha.themes.startify")

    vim.api.nvim_set_hl(0, "DashboardL1", { fg = colors.yellow_dark })
    vim.api.nvim_set_hl(0, "DashboardL2", { fg = colors.cyan_light })
    vim.api.nvim_set_hl(0, "DashboardL3", { fg = colors.cyan_native })
    vim.api.nvim_set_hl(0, "DashboardL4", { fg = colors.fuksia })

    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = icons.black_mesa
          .. "  Neo VIM | v. "
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch,
        opts = { hl = "DashboardL4", position = "left" },
      },
    }

    dashboard.opts.layout[0] = { type = "padding", val = 0 }
    dashboard.opts.layout[3] = { type = "padding", val = 1 }

    dashboard.section.top_buttons.val = {
      dashboard.button("n", icons.files.new .. " New File", "<cmd>ene<CR>"),
      -- dashboard.button("f", icons.files.find .. " Find File", "<cmd>Telescope find_files<CR>"),
      -- dashboard.button("t", icons.search .. " Find Text", "<cmd>Telescope live_grep<CR>"),
      -- dashboard.button("P", icons.projects .. " Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("p", icons.download .. " Plugins manager", "<cmd>Lazy<CR>"),
      dashboard.button("m", icons.target .. "  Lsp manager", "<cmd>Mason<CR>"),
      dashboard.button("c", icons.settings .. " Configuration", "<cmd>e $MYVIMRC<BAR>cd $HOME/.config/nvim<CR>"),
      -- dashboard.button("g", icons.github .. " Lazy Git", "<cmd>LazyGit<CR>"),
      -- dashboard.button("d", icons.docker .. "  Lazy Docker", "<cmd>LazyDocker<CR>"),
      -- dashboard.button("b", icons.database .. " DB UI", "<cmd>DBUI<CR><cmd>on<CR>"),
      -- dashboard.button("N", icons.note .. " Obsidian Note Keeper", "<cmd>ObsidianSearch<CR>"),
      dashboard.button("q", icons.close .. " Quit", "<cmd>qa<CR>"),
    }

    dashboard.section.bottom_buttons.val = {}

    dashboard.section.mru.val = { { type = "padding", val = 0 } }

    dashboard.section.mru_cwd.val = {
      { type = "padding", val = 1 },
      { type = "text", val = "File History", opts = { hl = "SpecialComment" } },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = function()
          return { dashboard.mru(0, vim.fn.getcwd(), 40) }
        end,
        -- opts = { shrink_margin = false },
      },
    }

    require("alpha").setup(dashboard.opts)
  end,
}
