---
tags: 
aliases: 
created: 27. Februar 2025
title: 
draft: false
---

# KDE Notes

## Task Switcher - Thumbnail Grid

> [!question] Konfigurieren Quit Keys wie in Windows 11: Alt+Tab -> Hold Tab -> Ctrl+W
> [Shortcut key to close tasks in Task Switcher like \`Del\` on Windows? : r/kde](https://www.reddit.com/r/kde/comments/191b227/shortcut_key_to_close_tasks_in_task_switcher_like/)

```bash
sudo vim /usr/share/kwin/tabbox/thumbnail_grid/contents/ui/main.qml
```

Statt `Qt.Key_W` kann ein beliebiger anderer Hotkey verwendet werden.

```qml
GridView {
    // ...
    Keys.onPressed: {
        if(event.key == Qt.Key_W) {
            tabBox.model.close(thumbnailGridView.currentIndex);
            thumbnailGridView.currentIndexChanged(thumbnailGridView.currentIndex);
        }
    }
} // GridView
```