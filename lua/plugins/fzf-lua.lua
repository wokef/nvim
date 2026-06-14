return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzfActions = require("fzf-lua.actions")

    local actions = {
      ["enter"] = fzfActions.file_edit,
      ["ctrl-q"] = fzfActions.file_sel_to_qf,
    }

    require("fzf-lua").setup({
      file_ignore_patterns = { "dismissed/" },
      winopts = {
        backdrop = 100,
        border = "rounded",
        preview = {
          hidden = true,
          layout = "horizontal",
          wrap = "nowrap",
          vertical = "up:55%",
          horizontal = "right:60%",
        },
      },
      keymap = {
        builtin = {
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
        },
        fzf = {
          ["ctrl-a"] = "select-all",
          ["ctrl-u"] = "deselect-all",
        },
      },
      actions = {
        files = actions,
      },

      oldfiles = {
        prompt = "History❯ ",
        cwd_only = true,
        stat_file = false,
        include_current_session = true,
        ignore_current_buffer = true,
      },
    })

    vim.cmd([[ FzfLua register_ui_select ]])
  end,
  keys = {
    { "<leader>f", "<cmd>FzfLua files<CR>", desc = "Search by filename" },
    { "<leader>sf", "<cmd>FzfLua git_files<CR>", desc = "Search by project filename" },
    { "<leader>sw", "<cmd>FzfLua grep_cword<CR>", desc = "Search in text under cursor" },
    { "<leader>sW", "<cmd>FzfLua grep_cWORD<CR>", desc = "Search out text under cursor" },
    { "<leader>sl", "<cmd>FzfLua lines<CR>", desc = "Search in file lines" },
    { "<leader>st", "<cmd>FzfLua grep<CR>", desc = "Search in file content" },
    { "<leader>sr", "<cmd>FzfLua oldfiles<CR>", desc = "Search recent file" },
    { "<leader>sb", "<cmd>FzfLua buffers<CR>", desc = "Search in buffers" },
    { "<leader>sq", "<cmd>FzfLua quickfix<CR>", desc = "Search in quickfix" },
    { "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", desc = "Show buffer diagnostics" },
    { "<leader>sd", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Search through diagnostics project messages" },
    { "<leader>sn", "<cmd>ObsidianTags<CR>", desc = "Search through notes by tags" },
    { "<leader>sT", "<cmd>TodoFzfLua<CR>", desc = "Search in TODO" },
    { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Show LSP references" },
    { "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Show LSP definitions" },
    { "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Show LSP implementations" },
    { "gt", "<cmd>FzfLua lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
    { "<leader>a", "<cmd>FzfLua lsp_code_actions<CR>", desc = "See available code actions" },
    { "<leader>go", "<cmd>FzfLua git_status<cr>", desc = "Open changed file" },
    {
      "<leader>sc",
      function()
        require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Search in neovim config",
    },
  },
}
