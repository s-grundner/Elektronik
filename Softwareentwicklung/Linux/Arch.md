---
tags:
aliases:
created: 27. April 2025
title: Arch Linux
release: false
---

# Arch Linux

## System Maintenance

> [!error] Pacman PGP Signing error [(Wiki)](https://wiki.archlinux.org/title/Pacman/Package_signing)
> Wenn bei einem System-Update der keyring veraltet ist, dann das System folgendermaßen Updaten:
>
> ```sh
> pacman -Sy --needed archlinux-keyring && pacman -Su
> ```