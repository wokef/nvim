return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_selected(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local num_selections = table.getn(picker:get_multi_selection())

      if num_selections > 1 then
        picker = action_state.get_current_picker(prompt_bufnr)
        for _, entry in ipairs(picker:get_multi_selection()) do
          local entryName = entry.value:match("(.*):[0-9]+:[0-9]+")

          if entryName == nil then
            entryName = entry.value
          end

          vim.cmd(string.format("%s %s", ":e!", entryName))
        end
        vim.cmd("stopinsert")
      else
        actions.file_edit(prompt_bufnr)
      end
    end

    local function open_all(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local manager = picker.manager

      for entry in manager:iter() do
        local entryName = entry.value:match("(.*):[0-9]+:[0-9]+")

        if entryName == nil then
          entryName = entry.value
        end

        vim.cmd(string.format("%s %s", ":e!", entryName))
      end

      vim.cmd("stopinsert")
    end

    local function to_quick_list(...)
      local actions = require("telescope.actions")

      actions.smart_send_to_qflist(...)
      actions.open_qflist(...)
    end

    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<cr>"] = open_selected,
            ["<C-a>"] = open_all,
            ["<C-q>"] = to_quick_list,
          },
          n = {
            ["<cr>"] = open_selected,
            ["<C-a>"] = open_all,
            ["<C-q>"] = to_quick_list,
          },
        },
      },
      pickers = {
        find_files = {
          no_ignore = true,
          hidden = true,
          layout_strategy = "vertical",
          -- sorting_strategy = "ascending",
          layout_config = {
            -- prompt_position = "top",
          },
          previewer = false,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
    })

    telescope.load_extension("projects")
  end,
}
