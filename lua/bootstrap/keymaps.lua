local k = vim.keymap.set

k("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No highlight" })
k("n", "<leader>q", "<cmd>:confirm q<CR>", { desc = "Quit" })
k("n", "<leader>w", "<cmd>:w<CR>", { desc = "Write" })
k("n", "<leader>W", "<cmd>noautocmd w<cr>", { desc = "Save without formatting (noautocmd)" })
k("n", "<leader>c", "<cmd>:BufferKill<CR>", { desc = "Close buffer" })
k("n", "<leader>o", "<cmd>:on<CR>", { desc = "Close others windows" })
k("n", "<leader>bo", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close others buffers" })
k("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Files explorer" })
k("n", "<leader>;", "<cmd>:Alpha<CR>", { desc = "Dashboard" })
k("n", "<leader>lm", "<cmd>:Mason<CR>", { desc = "Mason" })
k("n", "<leader>pm", "<cmd>:Lazy<CR>", { desc = "Lazy manager" })
k("n", "<leader>pd", "<cmd>:DBUIToggle<CR>", { desc = "Database UI" })
k("n", "<leader>pn", "<cmd>:Note<CR>", { desc = "Take notes" })
k("n", "<leader>H", "<cmd>:Inspect<cr>", { desc = "Inspect highlight under cursor" })

k("n", "ss", ":split<CR>", { desc = "Split Horizontal" })
k("n", "vs", ":vsplit<CR>", { desc = "Split verical" })

-- navigation
k("n", "H", ":BufferLineCyclePrev<CR>")
k("n", "L", ":BufferLineCycleNext<CR>")

-- terminal
k({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal float" })
k({ "n", "t" }, "<M-\\>", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle terminal bottom" })
k("t", "<C-l>", "<C-\\><C-n><C-\\>", { desc = "Terminal in normal mode" })

-- resize
k({ "n", "x" }, "<C-M-Up>", ":resize +2<CR>", { desc = "Resize window" })
k({ "n", "x" }, "<C-M-Right>", ":vertical resize +2<CR>", { desc = "Resize window" })
k({ "n", "x" }, "<C-M-Down>", ":resize -2<CR>", { desc = "Resize window" })
k({ "n", "x" }, "<C-M-Left>", ":vertical resize -2<CR>", { desc = "Resize window" })

-- navigation
k({ "n", "x" }, "<M-Up>", "<C-w>k", { desc = "Navigate window" })
k({ "n", "x" }, "<M-Right>", "<C-w>l", { desc = "Navigate window" })
k({ "n", "x" }, "<M-Down>", "<C-w>j", { desc = "Navigate window" })
k({ "n", "x" }, "<M-Left>", "<C-w>h", { desc = "Navigate window" })

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

k("n", "<leader>?", "<Plug>(comment_toggle_blockwise_current)", { desc = "Comment Toggle Block" })
k("x", "<leader>?", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment Toggle Block" })

k("n", "<leader>lt", "<cmd>Vista nvim_lsp<CR>", { desc = "LSP Tagbar" })
k("n", "<F4>", "<cmd>IBLToggle<CR>", { desc = "Toggle indent lines" })
k("n", "<F5>", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative number" })

-- search
k("n", "<leader>f", "<cmd>Telescope git_files<CR>", { desc = "Search by project filename" })
k("n", "<leader>F", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
k("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
k("n", "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in file lines" })
k("n", "<leader>st", "<cmd>Telescope live_grep<CR>", { desc = "Search in file content" })
k("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Search recent file" })
k("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search in buffers" })
k("n", "<leader>sp", "<cmd>Telescope projects<CR>", { desc = "Search projects" })
k("n", "<leader>sq", "<cmd>Telescope quickfix<CR>", { desc = "Search in quickfix" })

-- test
k("n", "<leader>ta", "<cmd>:TestFile<CR>", { desc = "Run full file tests" })
k("n", "<leader>ts", "<cmd>:TestNearest<CR>", { desc = "Run current focused test" })

-- git
k("n", "<leader>gg", "<cmd>:LazyGit<CR>", { desc = "Lazygit" })
k("n", "<leader>gf", "<cmd>G<cr>", { desc = "Fugitive" })
k("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", { desc = "Next Hunk" })
k("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", { desc = "Prev Hunk" })
k("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
k("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
k("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
k("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
k("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
k("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
