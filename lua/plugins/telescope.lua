return {
  "nvim-telescope/telescope.nvim",
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
      sorting_strategy = "descending",
      layout_config = {
        prompt_position = "bottom",
      },
      previewer = false,
      mappings = mappings,
      file_ignore_patterns = { "node%_modules/.*", "vendor/*", "dismissed/*" },
    }

    local preview_settings = {
      sorting_strategy = "descending",
      layout_config = {
        prompt_position = "bottom",
        width = 0.99,
        height = 0.99,
      },
      mappings = mappings,
      file_ignore_patterns = { "dismissed/*", "public/*" },
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

    -- search
    local k = vim.keymap.set

    k("n", "<leader>f", "<cmd>Telescope git_files<CR>", { desc = "Search by project filename" })
    k("n", "<leader>F", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
    k("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
    k("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "Search in text under cursor" })
    k("n", "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in file lines" })
    k("n", "<leader>st", "<cmd>Telescope live_grep<CR>", { desc = "Search in file content" })
    k("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Search recent file" })
    k("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search in buffers" })
    k("n", "<leader>sq", "<cmd>Telescope quickfix<CR>", { desc = "Search in quickfix" })
    k("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "Search through diagnostics messages" })
    k("n", "<leader>sn", "<cmd>ObsidianTags<CR>", { desc = "Search through notes by tags" })
    k("n", "<leader>sT", "<cmd>TodoTelescope<CR>", { desc = "Search in TODO" })
    k("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
    k("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
    k("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
    k("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
    k("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
    k("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
  end,
}
