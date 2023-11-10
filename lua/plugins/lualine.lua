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
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
          symbols = {
            added = icons.git.linesAdded,
            modified = icons.git.linesChanged,
            removed = icons.git.linesRemoved,
          },
          padding = { left = 2, right = 1 },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.lsp.Error,
            warn = icons.lsp.Warn,
            info = icons.lsp.Info,
            hint = icons.lsp.Hint,
          },
        },
        {
          function()
            local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
            if #buf_clients == 0 then
              return "LSP Inactive"
            end

            -- local buf_ft = vim.bo.filetype
            local buf_client_names = {}

            for _, client in pairs(buf_clients) do
              if client.name ~= "null-ls" and client.name ~= "copilot" then
                table.insert(buf_client_names, client.name)
              end
            end

            -- -- add formatter
            -- local formatters = require("lvim.lsp.null-ls.formatters")
            -- local supported_formatters = formatters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_formatters)

            -- -- add linter
            -- local linters = require("lvim.lsp.null-ls.linters")
            -- local supported_linters = linters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_linters)

            local unique_client_names = table.concat(buf_client_names, ", ")
            local language_servers = string.format("[%s]", unique_client_names)

            return language_servers
          end,
          color = { gui = "bold" },
        },
        "filetype",
      },
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
