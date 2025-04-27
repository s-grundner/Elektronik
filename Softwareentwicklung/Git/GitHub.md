---
tags: 
aliases: 
created: 27. April 2025
title: 
draft: false
---

# Github

## SSH Auth

- [Adding a new SSH key to your GitHub account - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

> [!info] tldr
>
> ````shell
> eval "$(ssh-agent -s)"
> ssh-keygen -t ed25519 -C "mymail@gmail"
> # Enter Filename: gh_ed25519
> # Enter passphrase: enter for no passphrase 
> ssh-add gh_ed25519
> ````