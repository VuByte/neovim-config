-- GLOBALS
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Insert Mode Navigation
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Nvim Tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- LSP
map("n", "<leader>pp", vim.lsp.buf.format, { desc = "Format Code" })
map("n", "<leader>pc", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>pd", vim.diagnostic.open_float, { desc = "Open Diagnostic Window" })
map("n", "C-k", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })
map("n", "C-j", vim.diagnostic.goto_prev, { desc = "Go to Prev Diagnostic" })
map("n", "<leader>tf", "<cmd>Lspsaga term_toggle<CR>", { desc = "Float Terminal" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

-- File Control
map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-a>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- Telescope
map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Telescope Colorschemes" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope Keymaps" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help Tags" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Recent Files" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope themes" })

map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find All Files" }
)

-- Terminals
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- Nvim DAP
map("n", "<leaderdq", "<cmd>lua require('dapui').float_element()<CR>", { desc = "Debugger float element" })
map("n", "<Leader>dl", "<cmd>DapStepInto<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>DapStepOver<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>DapStepOut<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>DapContinue<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>DapTerminate<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- LSP Saga Mappings
map("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle Float Terminal" })

-- Buffers
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
