-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap.set

local map = LazyVim.safe_keymap_set

map(
  "n",
  "gv",
  "<cmd>vsplit | lua vim.lsp.buf.definition({on_list = function(items) vim.fn.setqflist({}, 'r', items) vim.cmd('cfirst') end})<cr>",
  { silent = true, desc = "Open definition in vertical split" }
)

map("n", "gl", function()
  vim.diagnostic.open_float({ scope = "line" })
end, { silent = true, desc = "Open line diagnostics" })

-- Git blame
map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { silent = true, desc = "Toggle git blame" })
