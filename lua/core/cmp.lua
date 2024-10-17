-- dofile(vim.g.base46_cache .. "cmp")
-- local cmp = require "cmp"
--
-- local options = {
--   performance = {
--     debounce = 60,
--     throttle = 30,
--     fetching_timeout = 500,
--     confirm_resolve_timeout = 80,
--     async_budget = 1,
--     max_view_entries = 200,
--   },
--   -- window = {
--   --   completion = {
--   --     -- side_padding = 0,
--   --     -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
--   --     -- scrollbar = false,
--   --     -- border = border "CmpDocBorder",
--   --   },
--   --   documentation = {
--   --     -- border = border "CmpDocBorder",
--   --     -- winhighlight = "Normal:CmpDoc",
--   --   },
--   -- },
--   -- completion = {
--   --   -- completeopt = "menu,menuone,preview,noselect",
--   --   -- completeopt = "menuone", "menu",
--   --   -- completeopt = "menuone,noinsert,noselect",
--   --   -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
--   --   -- keyword_length = 2,
--   -- },
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ["<Enter>"] = cmp.mapping.confirm { select = false },
--     ["<C-e>"] = cmp.mapping.abort(),
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<Esc>"] = cmp.mapping.close(),
--
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif require("luasnip").expand_or_jumpable() then
--         require("luasnip").expand_or_jump()
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif require("luasnip").jumpable(-1) then
--         require("luasnip").jump(-1)
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--     -- ["<C-p>"] = cmp.mapping(function()
--     -- 	if cmp.visible() then
--     -- 		cmp.select_prev_item({ behavior = "insert" })
--     -- 	else
--     -- 		cmp.complete()
--     -- 	end
--     -- end),
--     -- ["<C-n>"] = cmp.mapping(function()
--     -- 	if cmp.visible() then
--     -- 		cmp.select_next_item({ behavior = "insert" })
--     -- 	else
--     -- 		cmp.complete()
--     -- 	end
--     -- end),
--   },
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "nvim_lua" },
--     { name = "path", keyword_length = 1 },
--   },
-- }
-- vim.tbl_deep_extend("force", options, require "nvchad.cmp")
dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"

local options = {
  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
    confirm_resolve_timeout = 80,
    async_budget = 1,
    max_view_entries = 200,
  },
  completion = { completeopt = "menu,menuone, noinsert" },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),

    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
