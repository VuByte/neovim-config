dofile(vim.g.base46_cache .. "nvimtree")
local options = {
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    number = false,
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
    indent_markers = { enable = true },
    icons = {},
  },
  filters = {
    dotfiles = true,
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = options,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
