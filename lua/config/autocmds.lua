-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Dim Neovim when tmux pane loses focus
local bg_groups = { "Normal", "NormalNC", "NeoTreeNormal", "NeoTreeNormalNC" }
local cached_bgs = {}

local function cache_theme_bg()
  for _, group in ipairs(bg_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    if hl.bg then
      cached_bgs[group] = string.format("#%06x", hl.bg)
    end
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
    for _, group in ipairs(bg_groups) do
      if cached_bgs[group] then
        vim.api.nvim_set_hl(0, group, { bg = cached_bgs[group] })
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    for _, group in ipairs(bg_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
})
