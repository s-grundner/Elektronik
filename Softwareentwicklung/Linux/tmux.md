---
tags:
  - Server/LSTronix
---

# TMUX Installation

[Installing · tmux/tmux Wiki · GitHub](https://github.com/tmux/tmux/wiki/Installing)

Siehe Guide. Meine Optionen waren lokal im user aus der source zu builden, da kein sudoer.

Dependencies (Neuste tarballs heruneterladen mit `wget`)
- Libevent: https://libevent.org/
- NCurses: https://invisible-island.net/ncurses/ncurses.html#downloads

Auf *configure flags* achten, wenn die dependencies lokal installiert werden

## TMUX Usage

Terminal Multiplexer: Startet Terminal Server im tmp Ordner.

| Create new session        | `tmux`               |
| ------------------------- | --------------------- |
| Create session with name  | `tmux new -s <name>` |
| List sessions             | `tmux ls`            |
| Attach to last session    | `tmux a`             |
| Attach to session by name | `tmux a -t <name>`   |
| Alle Sessions beenden     | `tmux kill-server`   |

### In Tmux

> [!hint] Prefix: `Ctrl + b`

#### Sessions

| Detach from session | `<prefix> d` | 
| ------------------- | ------------- |
| Rename session | `<prefix> $` |
| List sessions | `<prefix> s` |

#### Windows

| Create new window | `<prefix> c` |
| ------------------- | ------------- | 
| Kill window | `<prefix> &` |
| List windows | `<prefix> w` |
| Switch to window by number | `<prefix>, <number>` | 
| Cycle windows | `<prefix> p`, `<prefix> n` |

#### Panes

| Split pane horizontally | `<prefix> "` |
| ----------------------- | ------------- |
| Split pane vertically   | `<prefix> %` |
| Switch to adjacent pane | `<prefix> Arrow-Keys` |
| Swap panes              | `<prefix> {`, `<prefix> }` |
| Kill Pane               | `<prefix> x` |
| Show pane numbers       | `<prefix> q` |
| Maximize Pane           | `<prefix> z` |
| Turn Pane into Window   | `<prefix> !` |

> [!hint] Command Mode: `<prefix> :`

| `new` | Create new session | 

---

[Tmux Cheat Sheet & Quick Reference | Session, window, pane and more](https://tmuxcheatsheet.com/)
