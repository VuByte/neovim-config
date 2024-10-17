local options = {}
local highlight = {
  "Whitespace",
}
return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  -- event = "User FilePost",
  main = "ibl",
  opts = {
    indent = { char = "│", highlight = highlight },
    scope = { char = "│", highlight = highlight },
    -- indent = { char = "│" }
    -- indent = { char = "|", high },
    whitespace = { highlight = { "Whitespace", "NonText" } },
  },
  config = function(_, opts)
    local hooks = require "ibl.hooks"
    require("ibl").setup(opts)
  end,
}
