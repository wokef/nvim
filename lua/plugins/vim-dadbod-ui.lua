return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI", "DBUIFindBuffer", "DBUIToggle" },
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", lazy = true, ft = { "sql", "mysql", "plsql" } },
  },
  init = function()
    -- vim.g.db_ui_use_nvim_notify = 1
    -- vim.g.db_ui_notification_width = 10
    vim.g.db_ui_force_echo_notifications = 1
  end,
}
