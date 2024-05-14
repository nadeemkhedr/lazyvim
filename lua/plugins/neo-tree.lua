return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  opts = {
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
