return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = { enabled = false },
      },
    },
  },
}
