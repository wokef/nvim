local icon = require("bootstrap.icons")

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      truncate_names = false,
      color_icons = true,
      max_name_length = 50,
      separator_style = { "", "" },
      indicator = {
        icon = icon.extraBoldLineLeft,
        style = "icon",
      },
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(_, _, diagnostics, _)
        local icons = require("bootstrap.icons")
        local result = {}
        local symbols = {
          error = icons.lsp.Error,
          warning = icons.lsp.Warn,
          info = icons.lsp.Info,
        }

        for name, count in pairs(diagnostics) do
          if symbols[name] and count > 0 then
            table.insert(result, symbols[name] .. " " .. count)
          end
        end

        return table.concat(result, " ")
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          text_align = "center",
          separator = true,
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}
