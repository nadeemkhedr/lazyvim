return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  keys = {
    {
      "<leader>m",
      function()
        require("neo-tree.command").execute({ action = "show", toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
  },
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
        ["<cr>"] = "open",
        ["o"] = "open_with_window_picker",
      },
    },
  },
}
