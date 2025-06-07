---
tags: 
aliases: 
created: 27. Februar 2025
title: 
release: false
---

# KDE Notes

## Task Switcher - Thumbnail Grid

> [!question] Konfigurieren Quit Keys wie in Windows 11: Alt+Tab -> Hold Tab -> Ctrl+W
> [Shortcut key to close tasks in Task Switcher like \`Del\` on Windows? : r/kde](https://www.reddit.com/r/kde/comments/191b227/shortcut_key_to_close_tasks_in_task_switcher_like/)

In lokaler config datei bearbeiten. Wird beim pacman upgrade autmoatisch übernommen

```sh
nvim ~/.config/kwin/thumbnailgrid-main.qml
```

Wenn änderungen gleich übernommen werden sollen, hook cmd manuell ausführen:

```sh
cp ~/.config/kwin/thumbnailgrid-main.qml /usr/share/kwin/tabbox/thumbnail_grid/contents/ui/main.qml
```

### Close on Hotkey

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

### Vim Keybinds

```qml
// { ...
  Keys.onPressed: {
	if (event.key == Qt.Key_Left || event.key == Qt.Key_H) {
	  thumbnailGridView.moveCurrentIndexLeft();
	} else if (event.key == Qt.Key_Right || event.key == Qt.Key_L) {
	  thumbnailGridView.moveCurrentIndexRight();
	} else if (event.key == Qt.Key_Up || event.key == Qt.Key_K) {
	  thumbnailGridView.moveCurrentIndexUp();
	} else if (event.key == Qt.Key_Down || event.key == Qt.Key_J) {
	  thumbnailGridView.moveCurrentIndexDown();
	} else {
	  return;
	}

	thumbnailGridView.currentIndexChanged(thumbnailGridView.currentIndex);
  }
} // Dialog.mainItem

```

## Sicherung der Änderungen

Damit bei einem System Update diese Änderungen nicht überschrieben werden wird ein pacman hook eingrichtet.

in `/etc/pacman.d/hooks/kwin-restore-qml.hook`

```hook
[Trigger]
Operation = Upgrade
Type = Package
Target = kwin

[Action]
Description = Wiederherstellen modifizierter KWin QML-Dateien...
When = PostTransaction
Exec = /bin/bash -c 'cp ~/.config/kwin/thumbnailgrid-main.qml /usr/share/kwin/tabbox/thumbnail_grid/contents/ui/main.qml'
```

