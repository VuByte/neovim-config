dofile(vim.g.base46_cache .. "telescope")
local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    -- layout_config = {
    --   horizontal = {
    --     prompt_position = "top",
    --     preview_width = 0.55,
    --   },
    --   width = 0.90,
    --   height = 0.80,
    -- },
    mappings = {
      -- n = { ["q"] = require("telescope.actions").close },
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = options,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
    end,
  },
}
