return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      local languages = {
        "bash",
        "blade",
        "c",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "phpdoc",
        "query",
        "scss",
        "typescript",
        "vue",
      }

      for _, lang in ipairs(languages) do
        ts.install(lang)
      end

      local filetypes = {
        "bash",
        "sh",
        "blade",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "php",
        "sql",
        "mysql",
        "sqlite",
        "scss",
        "typescript",
        "vue",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
