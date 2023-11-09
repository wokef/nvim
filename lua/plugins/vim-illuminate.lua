return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require('illuminate').configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 120,
      filetype_overrides = {},
      filetypes_denylist = {
        "fugitive",
        "alpha",
        "NvimTree",
        "lazy",
        "toggleterm",
        "TelescopePrompt",
      },
      filetypes_allowlist = {},
      modes_denylist = {},
      modes_allowlist = {},
      providers_regex_syntax_denylist = {},
      providers_regex_syntax_allowlist = {},
      under_cursor = true,
    })
  end
}
