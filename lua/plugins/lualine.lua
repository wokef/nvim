return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("bootstrap.icons")
    local colors = require("bootstrap.colors")

    local style = { bg = colors.bg, fg = colors.fg }
    local inactive = { bg = colors.bg, fg = colors.fg }

    local sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = icons.git.branch },
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
        },
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
      },
      lualine_c = {},
      lualine_x = {
        {
          function()
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            if #buf_clients == 0 then
              return ""
            end

            local buf_client_names = {}
            for _, client in pairs(buf_clients) do
              if client.name ~= "copilot" then
                table.insert(buf_client_names, client.name)
              end
            end

            local lsp_format = require("conform.lsp_format")
            local lsp_clients = lsp_format.get_format_clients(buf_clients)
            for _, client in pairs(lsp_clients) do
              if not vim.tbl_contains(buf_client_names, client.name) then
                table.insert(buf_client_names, client.name)
              end
            end

            local conform = require("conform")
            local buf_formatters = conform.list_formatters()
            for _, client in pairs(buf_formatters) do
              if not vim.tbl_contains(buf_client_names, client.name) then
                table.insert(buf_client_names, client.name)
              end
            end

            for i, name in ipairs(buf_client_names) do
              name = name:gsub("%s+", "")
              name = name:sub(1, 1):upper() .. name:sub(2)
              buf_client_names[i] = name
            end

            return string.format("%s", table.concat(buf_client_names, "·"))
          end,
        },
        {
          "filetype",
          colored = false,
          icon_only = false,
        },
      },
      lualine_y = {
        "fileformat",
        "encoding",
        {
          function()
            local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })

            return icons.tab .. " " .. shiftwidth
          end,
        },
      },
      lualine_z = {
        { "progress", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
    }

    table.insert(sections.lualine_b, {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
      end,
    })

    local config = {
      options = {
        theme = {
          normal = {
            a = style,
            b = style,
            c = style,
          },
          insert = {
            a = style,
            b = style,
            c = style,
          },
          visual = {
            a = style,
            b = style,
            c = style,
          },
          replace = {
            a = style,
            b = style,
            c = style,
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
        section_separators = { left = icons.boldLineLeft, right = "" },
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
