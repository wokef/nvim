return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_entry(entry)
      local entryName = entry.filename

      if entryName == nil then
        entryName = entry.value
      end

      local entryFileName = entryName:match("(.*):[0-9]+:[0-9]+")

      if entryFileName == nil then
        entryFileName = entryName
      end

      vim.cmd(string.format("%s %s", ":e!", entryFileName))
    end

    local function open_selected(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local num_selections = #picker:get_multi_selection()

      if num_selections > 1 then
        actions.select_default(prompt_bufnr)

        for _, entry in pairs(picker:get_multi_selection()) do
          open_entry(entry)
        end
      else
        actions.file_edit(prompt_bufnr)
      end
    end

    local function open_all(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local manager = picker.manager
      actions.select_default(prompt_bufnr)

      for entry in manager:iter() do
        open_entry(entry)
      end
    end

    local function to_quick_list(...)
      actions.smart_send_to_qflist(...)
      actions.open_qflist(...)
    end

    local telescope = require("telescope")

    local mappings = {
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
    }

    local no_preview_settings = {
      no_ignore = true,
      hidden = true,
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
      previewer = false,
      mappings = mappings,
    }

    local preview_settings = {
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
        width = 0.99,
        height = 0.99,
      },
      mappings = mappings,
      file_ignore_patterns = { "node%_modules/.*", "vendor/*" },
      show_line = false,
    }

    telescope.setup({
      pickers = {
        find_files = no_preview_settings,
        git_files = no_preview_settings,
        buffers = no_preview_settings,
        oldfiles = no_preview_settings,
        current_buffer_fuzzy_find = preview_settings,
        grep_string = preview_settings,
        diagnostics = preview_settings,
        live_grep = preview_settings,
        lsp_references = preview_settings,
        lsp_implementations = preview_settings,
        git_status = preview_settings,
        quickfix = preview_settings,
        colorscheme = {
          enable_preview = true,
        },
      },
    })

    telescope.load_extension("projects")
  end,
}
