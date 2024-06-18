return {
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("hardtime").setup()
      vim.keymap.set({ "n" }, "<leader>ux", ":Hardtime toggle<CR>", { desc = "Toggle hardtime" })
    end,
  },
}
