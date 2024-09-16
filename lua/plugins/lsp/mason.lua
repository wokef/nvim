return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
        "phpactor",
        "tailwindcss",
        "ts_ls",
        "volar",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "pint",
        "prettier",
        "stylua",
        "sql-formatter",
      },
    })
  end,
}
