-- Work around a neo-tree bug: when the `git status` output is unchanged since the
-- last run, git.status() returns early from its cache and drops the diff-vs-base
-- (third return value), so the git_status source renders empty for a non-HEAD
-- git_base. Wrap it to recompute the diff when the cache short-circuits.
local git_base_fix_applied = false
local function ensure_git_base_diff_fix()
  if git_base_fix_applied then
    return
  end
  git_base_fix_applied = true
  local git = require("neo-tree.git")
  local orig_status = git.status
  git.status = function(path, base_lookup, skip_bubbling, status_opts)
    local status, root, diff = orig_status(path, base_lookup, skip_bubbling, status_opts)
    local base = root and base_lookup and base_lookup[root]
    if base and base ~= "HEAD" and not diff then
      diff = require("neo-tree.git.diff").diff_name_status(root, base, not not skip_bubbling)
    end
    return status, root, diff
  end
end

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
    -- Override LazyVim's <leader>ge to always diff against HEAD, since neo-tree
    -- remembers the last git_base and would otherwise keep <leader>gE's branch base
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true, git_base = "HEAD" })
      end,
      desc = "Git Explorer",
    },
    -- Like <leader>ge, but shows all files changed in the current branch
    {
      "<leader>gE",
      function()
        local base = vim.fn.system("git merge-base main HEAD"):gsub("%s+", "")
        if vim.v.shell_error ~= 0 then
          vim.notify("Failed to get merge base with main", vim.log.levels.ERROR)
          return
        end
        ensure_git_base_diff_fix()
        require("neo-tree.command").execute({ source = "git_status", toggle = true, git_base = base })
      end,
      desc = "Git Explorer (branch changes)",
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { ".git" },
      },
      window = {
        mappings = {
          ["f"] = "fuzzy_finder",
        },
      },
    },
    window = {
      mappings = {
        ["/"] = "none",
        ["f"] = "none",
        ["<cr>"] = "open",
        ["o"] = "open_with_window_picker",
      },
    },
    git_status = {
      window = {
        mappings = {
          -- Keep gg as "go to first line" instead of git_commit_and_push
          ["gg"] = "none",
        },
      },
    },
  },
}
