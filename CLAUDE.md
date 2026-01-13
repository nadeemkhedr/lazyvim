# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built on [LazyVim](https://lazyvim.github.io/). LazyVim is a Neovim setup powered by lazy.nvim that provides sensible defaults and a structured plugin system.

## Architecture

```
~/.config/nvim/
├── init.lua                 # Entry point - loads config.lazy
├── lazy-lock.json          # Plugin version lockfile
└── lua/
    ├── config/
    │   ├── lazy.lua        # lazy.nvim bootstrap and plugin spec loading
    │   ├── options.lua     # Vim options and filetype associations
    │   ├── keymaps.lua     # Custom keybindings
    │   └── autocmds.lua    # Autocommands (currently empty, uses LazyVim defaults)
    └── plugins/            # Plugin configurations (each file returns a table)
```

## Plugin Configuration Pattern

Each file in `lua/plugins/` returns a Lua table that lazy.nvim processes. To configure plugins:

- **Add a plugin**: Return `{ "author/plugin-name" }`
- **Override LazyVim plugin opts**: Return `{ "plugin-name", opts = { ... } }`
- **Disable a LazyVim plugin**: Return `{ "plugin-name", enabled = false }`
- **Import LazyVim extras**: Return `{ import = "lazyvim.plugins.extras.category.name" }`

The `example.lua` file contains commented examples of all these patterns.

## Key Custom Configurations

- **Root detection**: Uses `.git` or `lua` directories, then LSP, then cwd (`vim.g.root_spec`)
- **Filetype mappings**: `*.tml` → gohtmltmpl, `.env.*` → sh
- **Inlay hints**: Disabled by default in LSP config
- **Custom keymaps**: See `lua/config/keymaps.lua` for bindings like `gv` (definition in vsplit), `gl` (line diagnostics), `<leader>gb` (git blame), `<leader>uT` (transparency toggle)

## Useful Commands

```bash
# Check plugin status
nvim --headless "+Lazy! sync" +qa

# Update plugins
nvim --headless "+Lazy! update" +qa

# Check health
nvim "+checkhealth"
```

## Working With This Config

- Use `LazyVim.safe_keymap_set` (aliased as `map` in keymaps.lua) for new keybindings
- Plugin lockfile (`lazy-lock.json`) tracks exact versions - commit changes to it when updating plugins
- LazyVim defaults are documented at https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/config
