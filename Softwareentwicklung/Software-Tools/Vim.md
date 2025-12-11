---
tags:
  - Editor
aliases:
  - Neovim
  - NVim
created: 17. Januar 2024
title: Vim
release: false
---

# Vim

> [!info] Ressourcen
> 
> - [vim-cheatsheet](../../10_tools/pdf/vim-cheatsheet.pdf)

## Movements und Commands

### Visual Block Mode, Macros

```vim
:help q
:help visual-block
```

> [!example] [Arbeiten mit Multicursor](https://www.youtube.com/watch?v=tdbHFNxEBhM)

### Filter

```vim
:help !
```

> [!example] Beispiel: im Buffer ist im Visual-Mode folgender String Selektiert:
> `1+2+5*5`
> Ziel ist es den Ausdruck mit dem Basic-Calculator Programm `bc` auszuwerten
> `'<,'>!bc`

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