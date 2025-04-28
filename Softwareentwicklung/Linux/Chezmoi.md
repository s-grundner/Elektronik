---
tags: 
aliases:
  - dotfiles
created: 27. April 2025
title: 
draft: false
---

# Dotfiles mit chezmoi Managen

Chezmoi bietet ein interface, um dotfiles für Konfigurationen via Git zu Managen. 

## Init

Durch das eingeben eines git remotes wird eine bestehende repo initialisiert, sonst eine neue.

```sh
chezmoi init [git remote]
```

## add Dotfiles

File/Directory als gemanaged markieren: `chezmoi add [file|dir]`

## edit Dotfiles

1. Methode
	- `chezmoi edit [file]` editiert das dotfile direkt in der repo
	- `chezmoi apply` wendet die änderungen auf die user config an
2. Methode
	- File lokal editieren
	- ``

## Chezmoi Config

Die Config-Datei `~/.config/chezmoi/chezmoi.toml` für chezmoi selbst kann nicht gemanaged werden. Diese ist Host spezifisch.

