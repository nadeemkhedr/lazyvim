return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>uz", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>uZ", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      watermark = "",
      save_path = "~/Downloads",
      has_breadcrumbs = true,
      has_line_number = true,
    },
  },
}
