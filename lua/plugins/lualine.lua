return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("../bootstrap/icons")

    local function gitdiff()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    local sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "b:gitsigns_head",
          icon = "%#SLGitIcon#" .. icons.git.branch .. "%*" .. "%#SLBranchName#",
          color = { gui = "bold" },
        },
      },
      lualine_c = {
        {
          "diff",
          source = gitdiff(),
          symbols = {
            added = icons.git.linesAdded .. " ",
            modified = icons.git.linesChanged .. " ",
            removed = icons.git.linesRemoved .. " ",
          },
          padding = { left = 2, right = 1 },
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }

    local config = {
      options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha" },
      },
      sections = sections,
      inactive_sections = sections,
      tabline = {},
      extensions = {},
    }

    require("lualine").setup(config)
  end,
}
