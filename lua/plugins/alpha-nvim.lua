return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("../bootstrap/icons")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.highlight = "string"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.header.val = {
      "             ▖     ",
      "┌─╮╭─╮╭─╮▖  ▖▖▄▄▗▄ ",
      "│ │├─┘│ │▝▖▞ ▌▌ ▌ ▌",
      "╵ ╵╰─╯╰─╯ ▝  ▘▘ ▘ ▘",
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", icons.files.new .. " New File", "<cmd>ene<CR>"),
      dashboard.button("f", icons.files.find .. " Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("t", icons.search .. " Find Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("u", icons.download .. " Check for update", "<cmd>Lazy update<CR>"),
      dashboard.button("c", icons.settings .. " Configuration", "<cmd>e $MYVIMRC<CR>"),
      dashboard.button("q", icons.close .. " Quit", "<cmd>qa<CR>"),
    }

    local linux = os.getenv("WSL_DISTRO_NAME") .. [[ ]] .. os.getenv("HOSTTYPE")
    local wslVersion = "N.A.    "
    local winVersion = "N.A.          "
    local kernelVersion = "N.A.     "
    local wsl = io.popen("wsl.exe --version", "r")
    local user = os.getenv("USER") .. [[@]] .. os.getenv("NAME")

    if wsl ~= nil then
      local versions = tostring(wsl:read("*a"))
      wsl:close()
      versions = versions:gsub("[^0-9.\n]", "")

      local versionsTable = {}
      for w in string.gmatch(versions, "[^\n]+") do
        table.insert(versionsTable, w)
      end

      wslVersion = "WSL 2" .. versionsTable[1]:sub(versionsTable[1]:find(".") + 1)
      kernelVersion = "Kernel " .. versionsTable[2]
      winVersion = "Win 11 Pro " .. versionsTable[7]
    end

    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.footer.val = {
      [[ 👨 ┊ ]] .. user .. [[                                ]],
      [[ 🪟 ┊ ]] .. winVersion,
      [[ 🪅 ┊ ]] .. wslVersion,
      [[ 🐧 ┊ ]] .. linux,
      [[ 🧩 ┊ ]] .. kernelVersion,
    }

    require("alpha").setup(dashboard.opts)
  end,
}
