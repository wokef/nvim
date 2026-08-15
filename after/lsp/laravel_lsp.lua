--- @type vim.lsp.Config
return {
  cmd = { "laravel-lsp" },
  filetypes = { "php", "blade" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, "artisan")

    if root then
      on_dir(root)
    end
  end,
  before_init = function(params, config)
    local project = vim.fs.basename(config.root_dir)

    params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
      phpCommand = {
        "docker",
        "exec",
        "-t",
        "-w",
        "/srv/codes/" .. project,
        "php_83",
        "php",
      },
    })
  end,
}
