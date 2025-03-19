return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dapui_virtual = require("nvim-dap-virtual-text")
      local which_key = require("which-key")
      local k = vim.api.nvim_set_keymap

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/home/marco/.local/share/nvim/vscode-php-debug/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          log = true,
          pathMappings = {
            ["/var/www/html"] = "/srv/codes/",
          },
        },
      }

      dapui.setup({
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
          },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = "",
        },
        layouts = {
          {
            elements = {
              {
                id = "repl",
                size = 0.1,
              },
              {
                id = "scopes",
                size = 0.4,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              {
                id = "stacks",
                size = 0.25,
              },
              -- {
              --   id = "watches",
              --   size = 0.25,
              -- },
            },
            position = "left",
            size = 40,
          },
          -- {
          --   elements = {
          --     {
          --       id = "repl",
          --       size = 0.5,
          --     },
          --     {
          --       id = "console",
          --       size = 0.5,
          --     },
          --   },
          --   position = "bottom",
          --   size = 10,
          -- },
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui_virtual.setup()

      which_key.add({ { "<leader>d", group = "DAP Debugger" } })
      k("n", "<leader>dd", "<cmd>DapContinue<CR>", { desc = "Enable Debugger" })
      k("n", "<leader>ds", "<cmd>DapTerminate<CR>", { desc = "Terminate" })
      k("n", "<leader>dn", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
      k("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
      k("n", "<leader>du", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
      k("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
      k("n", "<leader>dv", "<cmd>lua require 'dapui'.eval(nil, {enter = true})<CR>", { desc = "Show variable" })
      k("n", "<leader>du", "<cmd>lua require 'dapui'.toggle()<CR>", { desc = "Toggle debugger UI" })
    end,
  },
}
