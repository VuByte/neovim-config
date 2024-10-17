return {
  "williamboman/mason.nvim",
  lazy = true,
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require "mason"

    -- import mason-lspconfig
    local mason_lspconfig = require "mason-lspconfig"

    local mason_tool_installer = require "mason-tool-installer"

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      max_concurrent_installers = 10,
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        "asm_lsp",
        "lua_ls",
        "clangd",
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        "asmfmt",
        "codelldb",
        "stylua", -- lua formatter
        "clang-format",
      },
    }
  end,
}
