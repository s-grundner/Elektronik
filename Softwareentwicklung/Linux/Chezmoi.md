---
tags:
aliases:
  - dotfiles
created: 27. April 2025
title: Chemzoi
release: true
---

# Dotfiles mit chezmoi verwalten

> [!info] [Reference - chezmoi](https://www.chezmoi.io/reference/)
> Chezmoi bietet ein interface, um dotfiles für Konfigurationen via Git zu verwalten. 

## Init

Durch das eingeben eines git remotes wird eine bestehende repo initialisiert, sonst eine neue.

```sh
chezmoi init [git remote]
```

## Add Dotfiles

File/Directory als gemanaged markieren: `chezmoi add {file|dir}`

## Edit Dotfiles

1. Methode
	- `chezmoi edit {file}` editiert das dotfile direkt in der repo
	- `chezmoi apply` wendet die änderungen auf die user config an
2. Methode
	- File lokal editieren
	- `chezmoi add {file}`

## Chezmoi Config

Die Config-Datei `~/.config/chezmoi/chezmoi.toml` für chezmoi selbst kann nicht gemanaged werden. Diese ist Host spezifisch. Dafür kann in der Repository ein template file angelegt werden.

## Unterschiede zwischen Hosts

[Templating - chezmoi](https://www.chezmoi.io/user-guide/templating/)