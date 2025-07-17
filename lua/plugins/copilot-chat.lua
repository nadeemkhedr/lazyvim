return {
  -- TODO: temp solution: https://github.com/LazyVim/LazyVim/issues/5899#issuecomment-2781398031
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      mappings = {
        reset = {
          insert = "<c-x>",
          normal = "<c-x>",
        },
      },
    },
  },
}
