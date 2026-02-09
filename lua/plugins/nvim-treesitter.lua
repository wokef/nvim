return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    -- dependencies = {
    -- "JoosepAlviste/nvim-ts-context-commentstring",
    -- { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
    -- "windwp/nvim-ts-autotag",
    -- },
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

      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
