return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI", "DBUIFindBuffer", "DBUIToggle" },
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", lazy = true, ft = { "sql", "mysql", "plsql" } },
  },
}
