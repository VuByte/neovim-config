local map = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require "lspconfig"

    -- import mason_lspconfig plugin
    local mason_lspconfig = require "mason-lspconfig"

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        -- set keybinds
        map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" }) -- show definition, references

        map("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

        map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP definitions" }) -- show lsp definitions
        map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP implementations" }) -- show lsp implementations
        map("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type definitions" }) -- show lsp type definitions
        map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename
        map("n", "<leader>K", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostic" }) -- show  diagnostics for file
        map("n", "<leader>k", vim.diagnostic.open_float, { desc = "Line diagnostic" }) -- show diagnostics for line
        map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer
        map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostichin buffer
        map("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation under cursor" }) -- show documentation for what is under cursor
        map("n", "<leader>lq", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
      end,
    })
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    --    󰠠
    local signs = { Error = "", Warn = " ", Hint = "", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ["asm_lsp"] = function()
        lspconfig["asm_lsp"].setup {
          capabilities = capabilities,
          filetypes = { "asm", "s", "S" },
        }
      end,
      ["zls"] = function()
        lspconfig["zls"].setup {
          capabilities = capabilities,
          cmd = { "/usr/local/bin/zls" },
          filetypes = { "zig", "zon" },
          settings = {
            zls = {
              zig_exe_path = { "/home/relock/Programms/Zig/zig" },
            },
          },
        }
      end,
      ["clangd"] = function()
        lspconfig["clangd"].setup {
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--clang-tidy",
            "--background-index",
            "--pch-storage=memory",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--compile-commands-dir=./build",
          },
          init_options = {
            usePlaceholders = true,
            restartAfterCrash = true,
            completeUnimported = true,
            clangdFileStatus = true,
            semanticHighlighting = true,
            fallbackFlags = { "-std=c17", "-Wextra", "-Wall", "-Wpedantic" },
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          single_file_support = true,
        }
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,
    }
  end,
}
