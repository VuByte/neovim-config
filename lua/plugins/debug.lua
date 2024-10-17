return {
  {
    "msfussenegger/nvim-dap",
    -- event = "LspAttach",
    -- cmd = {
    --   "DapContinue",
    --   "DapDisconnect",
    --   "DapEval",
    --   "DapLoadLaunchJSON",
    --   "DapNew",
    --   "DapRestartFrame",
    --   "DapSetLogLevel",
    --   "DapShowLog",
    --   "DapStepInto",
    --   "DapStepOver",
    --   "DapTerminate",
    --   "DapToggleBreakpoint",
    --   "DapToggleRepl",
    -- },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "LspAttach",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
}
