return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("bootstrap.icons")
    local colors = require("bootstrap.colors")

    local text_dark = { bg = colors.black, fg = colors.normal }
    local text_light = { bg = colors.black_light, fg = colors.grey_light }
    local inactive = { bg = colors.black_light, fg = colors.grey, gui = "" }
    local insert_a = { bg = colors.fuksia, fg = colors.white, gui = "" }
    local normal_a = { bg = colors.cyan, fg = colors.black, gui = "" }
    local visual_a = { bg = colors.orange, fg = colors.white, giu = "" }

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
        theme = {
          normal = {
            a = normal_a,
            b = text_light,
            c = text_dark,
          },
          insert = {
            a = insert_a,
            b = text_light,
            c = text_dark,
          },
          visual = {
            a = visual_a,
            b = text_light,
            c = text_dark,
          },
          replace = {
            a = insert_a,
            b = text_light,
            c = text_dark,
          },
          inactive = {
            a = inactive,
            b = inactive,
            c = inactive,
          },
        },
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
