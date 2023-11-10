local k = vim.keymap.set

k({ "x", "n" }, "<leader>q", "<cmd>:q<CR>", { desc = "Quit" })
k({ "x", "n" }, "<leader>w", "<cmd>:w<CR>", { desc = "Write" })
k({ "x", "n" }, "<leader>c", "<cmd>:BufferKill<CR>", { desc = "Close buffer" })
k({ "x", "n" }, "<leader>o", "<cmd>:on<CR>", { desc = "Close others windows" })
k({ "x", "n" }, "<leader>bo", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close others buffers" })
k({ "x", "n" }, "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Files explorer" })

k({ "x", "n" }, "ss", ":split<CR>", { desc = "Split Horizontal" })
k({ "x", "n" }, "vs", ":vsplit<CR>", { desc = "Split verical" })

-- navigation
k("n", "H", ":BufferLineCyclePrev<CR>")
k("n", "L", ":BufferLineCycleNext<CR>")

-- terminal
k({ "n", "x", "t" }, "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal float" })
k("t", "<C-l>", "<C-\\><C-n><C-\\>", { desc = "Terminal in normal mode" })

-- move selection indent mode and up/down
k("v", "<", "<gv")
k("v", ">", ">gv")
k("n", "<A-j>", ":m .+1<CR>==")
k("n", "<A-k>", ":m .-2<CR>==")
k("x", "<A-j>", ":m '>+1<CR>gv-gv")
k("x", "<A-k>", ":m '<-2<CR>gv-gv")
k("n", "]q", ":cnext<CR>")
k("n", "[q", ":cprev<CR>")

k("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment Toggle" })
k("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment Toggle" })

k({ "n", "x" }, "<leader>lt", "<cmd>Vista nvim_lsp<CR>", { desc = "LSP Tagbar" })
k("n", "<F4>", "<cmd>IBLToggle<CR>", { desc = "Toggle indent lines" })

-- search
k("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
k("n", "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in file lines" })
k("n", "<leader>st", "<cmd>Telescope live_grep<CR>", { desc = "Search in file content" })
k("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Search recent file" })
k("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search in buffers" })

-- git
k("n", "<leader>gg", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd("startinsert!")
    end,
    on_close = function(_) end,
    count = 99,
  })
  lazygit:toggle()
end, { desc = "Lazygit" })
k("n", "<leader>gf", "<cmd>G<cr>", { desc = "Fugitive" })
k("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", { desc = "Next Hunk" })
k("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", { desc = "Prev Hunk" })
k("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
k("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
k("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
k("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
k("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
k("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
