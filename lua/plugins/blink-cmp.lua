return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",

  dependencies = {
    "rafamadriz/friendly-snippets",
    "kristijanhusak/vim-dadbod-completion",
  },

  opts = {
    keymap = {
      preset = "none",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show" },
      ["<C-e>"] = { "hide", "fallback" },

      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },

      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
    },

    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },

      menu = {
        border = "rounded",

        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,

        window = {
          border = "rounded",
        },
      },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },

      per_filetype = {
        sql = {
          "snippets",
          "dadbod",
          "buffer",
        },
        mysql = {
          "snippets",
          "dadbod",
          "buffer",
        },
        plsql = {
          "snippets",
          "dadbod",
          "buffer",
        },
      },

      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}
