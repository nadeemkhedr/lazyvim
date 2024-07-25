return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gl", "<cmd>GitLink! current_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
      { "<leader>gB", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open git blame in the browser" },
    },
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({ enabled = false })
    end,
  },
}
