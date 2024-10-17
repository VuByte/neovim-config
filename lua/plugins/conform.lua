local options = {
  -- Define your formatters
  formatters_by_ft = {
    asm = { "asmfmt" },
    lua = { "stylua" },
    c = { "my_formatter" },
    cpp = { "my_formatter" },
    zig = { "zig fmt" },
  },
  -- Set default options
  -- default_format_opts = {
  --   lsp_format = "fallback",
  -- },
  -- Set up format-on-save
  format_on_save = { timeout_ms = 500 },
  -- Customize formatters
  formatters = {
    my_formatter = {

      command = "clang-format",

      args = '--style="{BasedOnStyle: llvm, IndentWidth: 2}"',
    },
  },
}

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufRead" },
  cmd = { "ConformInfo" },
  opts = options,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fm",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
}
