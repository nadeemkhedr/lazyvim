return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { ".git" },
      },
    },
    window = {
      mappings = {
        ["/"] = "none",
        ["f"] = "fuzzy_finder",
        ["<cr>"] = "open_with_window_picker",
        ["o"] = "open",
      },
    },
  },
}
