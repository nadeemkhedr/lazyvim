return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local config = require("fzf-lua.config")
      config.defaults.keymap.builtin["<c-t>"] = "toggle-preview"
      config.defaults.keymap.builtin["<c-d>"] = "toggle-fullscreen"
    end,
  },
}
