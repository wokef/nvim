return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      indicator = {
        icon = "▍",
        style = "icon",
      },
      mode = "buffers",
      truncate_names = false,
      separator_style = { "", "" },
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
