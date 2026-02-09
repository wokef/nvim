return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("bootstrap.icons")
    local colors = require("bootstrap.colors")
    local dashboard = require("alpha.themes.startify")

    vim.api.nvim_set_hl(0, "DashboardTitle", { fg = colors.fuksia })

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
        opts = { hl = "DashboardTitle", position = "left" },
      },
    }

    dashboard.opts.layout[0] = { type = "padding", val = 0 }
    dashboard.opts.layout[3] = { type = "padding", val = 1 }

    dashboard.section.top_buttons.val = {
      dashboard.button("n", icons.files.new .. " New File", "<cmd>ene<CR>"),
      dashboard.button("p", icons.download .. " Plugins manager", "<cmd>Lazy<CR>"),
      dashboard.button("m", icons.target .. "  Lsp manager", "<cmd>Mason<CR>"),
      dashboard.button("c", icons.settings .. " Configuration", "<cmd>e $MYVIMRC<BAR>cd $HOME/.config/nvim<CR>"),
      dashboard.button("q", icons.close .. " Quit", "<cmd>qa<CR>"),
    }

    dashboard.section.bottom_buttons.val = {}

    dashboard.section.mru.val = { { type = "padding", val = 0 } }

    dashboard.section.mru_cwd.val = {
      { type = "padding", val = 1 },
      { type = "text", val = "CWD: " .. vim.fn.getcwd(), opts = { hl = "Special" } },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = function()
          return { dashboard.mru(0, vim.fn.getcwd(), 40) }
        end,
      },
    }

    require("alpha").setup(dashboard.opts)
  end,
}
