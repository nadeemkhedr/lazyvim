-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Dim Neovim when tmux pane loses focus
local function cache_theme_bg()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  if normal.bg then
    vim.g._theme_normal_bg = string.format("#%06x", normal.bg)
  end
end

-- Capture current theme bg immediately (colorscheme already loaded by VeryLazy)
cache_theme_bg()

-- Re-cache if colorscheme changes later
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = cache_theme_bg,
})

vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = vim.g._theme_normal_bg })
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  end,
})
