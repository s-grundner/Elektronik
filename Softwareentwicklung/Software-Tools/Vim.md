---
tags:
  - Editor
aliases:
  - Neovim
  - NVim
created: 17. Januar 2024
title: 
draft: false
---

# Vim

> [!info] Ressourcen
> 
> - [vim-cheatsheet](../../10_tools/pdf/vim-cheatsheet.pdf)
> - [Vim Doesn't Need Multi Cursors Like IDEs - YouTube](https://www.youtube.com/watch?v=tdbHFNxEBhM)

## Neovim - NVChad


- Preconfig: [NvChad](https://nvchad.com/)

### Copilot für NVChad

in `~/.config/nvim/lua/plugins.lua`:

```lua
return {
    -- ...
    {
        "github/copilot.vim",
        lazy = false, -- load plugin on startup
        config = function()
            vim.g.copilot_no_tab_map = true; -- Disable tab for completion
            vim.g.copilot_assume_mapped = true; -- Assume that the mappings are already set 
        end
    }
}
```

in `~/.config/nvim/lua/mappings.lua`:

```lua

map('i', '<C-l>', function()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })
```

