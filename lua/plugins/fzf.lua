return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local config = require("fzf-lua.config")
      config.defaults.keymap.builtin["<c-t>"] = "toggle-preview"
      config.defaults.keymap.builtin["<c-d>"] = "toggle-fullscreen"
    end,
    keys = {
      -- Remap "Find Config File" to <leader>fC
      { "<leader>fc", false },
      { "<leader>fC", LazyVim.pick.config_files(), desc = "Find Config File" },
      -- Show all files changed in current branch
      {
        "<leader>fc",
        function()
          local fzf = require("fzf-lua")
          local base = vim.fn.system("git merge-base main HEAD"):gsub("%s+", "")
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to get merge base with main", vim.log.levels.ERROR)
            return
          end
          local cwd = vim.fn.system("git rev-parse --show-toplevel"):gsub("%s+", "")
          fzf.fzf_exec("git diff --name-only " .. base .. " HEAD", {
            cwd = cwd,
            file_icons = true,
            color_icons = true,
            actions = fzf.defaults.actions.files,
            previewer = "builtin",
            fn_preprocess = function(o)
              return require("fzf-lua.make_entry").preprocess(o)
            end,
            fn_transform = function(line, o)
              return require("fzf-lua.make_entry").file(line, o)
            end,
          })
        end,
        desc = "Branch Changed Files",
      },
    },
  },
}
