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

-- access .env file in the current git directory
local open_env_file = function()
  local dir = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")
  local file = vim.fn.findfile(".env", dir)
  vim.cmd("e " .. vim.fn.fnameescape(file))
end
map("n", "<leader>oe", open_env_file, { desc = "Open env file in current git directory" })

-- change word with <c-c>
map({ "n", "x" }, "<C-c>", "<cmd>normal! ciw<cr>a")

-- toggle quickfix window with c-q
vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])
map("n", "<c-q>", ":call QuickFixToggle()<cr>")

-- toggle background transparency
local transparency_enabled = false
local function toggle_transparency()
  transparency_enabled = not transparency_enabled
  if transparency_enabled then
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  else
    vim.cmd.colorscheme(vim.g.colors_name)
  end
end
map("n", "<leader>uT", toggle_transparency, { desc = "Toggle transparency" })

-- Option/Alt word movement (mac terminals often send <M-b>/<M-f>)
vim.keymap.set({ "n", "v", "o" }, "<M-b>", "b", { silent = true })
vim.keymap.set({ "n", "v", "o" }, "<M-f>", "w", { silent = true })

-- In insert mode, move by word without leaving insert
vim.keymap.set("i", "<M-b>", "<C-o>b", { silent = true })
vim.keymap.set("i", "<M-f>", "<C-o>w", { silent = true })
