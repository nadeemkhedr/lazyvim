return {
  {
    "nvim-telescope/telescope.nvim",
    -- Obsidian
    keys = {
      {
        "<leader>of",
        function()
          require("telescope.builtin").find_files({
            cwd = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Mind",
          })
        end,
        desc = "Find Obsidian File",
      },
      {
        "<leader>os",
        function()
          require("telescope.builtin").live_grep({
            cwd = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Mind",
            search_dirs = {},
          })
        end,
        desc = "Grep Obsidian Files",
      },
    },
    opts = function()
      local find_files_no_ignore = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", { no_ignore = true, hidden = true, default_text = line })()
      end
      return {
        defaults = {
          mappings = {
            i = {
              ["<tab>"] = require("telescope.actions.layout").toggle_preview,
              ["<esc>"] = require("telescope.actions").close,
              ["<c-z>"] = find_files_no_ignore,
            },
          },
        },
      }
    end,
  },
}
