---
tags: 
aliases: 
created: 28. Februar 2025
title: 
release: false
---

# Git - Lokaler Server

https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server

Das Erstellen eines eigenen Git-Servers ist relativ einfach, eine direkte Anleitung für Windows:
- [https://medium.com/@piteryo7/how-to-set-up-git-server-on-local-network-windows-tutorial-7ec5cd2df3b1](https://medium.com/@piteryo7/how-to-set-up-git-server-on-local-network-windows-tutorial-7ec5cd2df3b1)

Für Linux (inklusive Setup für SSH-Verbindung):
- <https://www.linux.com/tutorials/how-run-your-own-git-server/>

Sollen Git-Repos selbst gehostet werden (Firmen-Interna auf GitLab?!), dann muss ein Server aufgesetzt werden.

## Remote und Lokales-Repo auf einem Rechner

Voraussetzung: git-for-windows

- Ordner Erstellen (Groß-/Kleinschreibung, Sonderzeichen, Leerzeichen … bewusst einsetzen)

```
> mkdir c:\git_server
```

- Projekt Anlegen:

```
c:\git_server> git init myProject.git --bare
Initialized empty Git repository in c:/git_server/myProject.git/
```

Fertig - das Git-Remote-Repo ist erstellt.

- lokales Repo auf dem gleichen Rechner, hier soll das lokale Repo im Verzeichnis `c:\temp\myProject` liegen:

```
> mkdir c:\temp\myProject
> cd c:\temp\myProject
> git clone c:/git_server/myProject.git ./
```

Ab hier kann mit dem lokalen Repo wie gewohnt gearbeitet werden. Das Remote-Repo:

```
c:\temp\myproject>git remote -v
origin  c:/git_server/myProject.git (fetch)
origin  c:/git_server/myProject.git (push)
```

## Arbeiten in einem lokalen Netz

Damit in einem lokalen Netz (Schulrechner, Heimnetzwerk, Firmennetzwerk …) gearbeitet werden kann, muss das *git_server*-Verzeichnis mittels Netzfreigabe (für entsprechende Benutzer) zugreifbar gemacht werden (Kontext-Menü des Verzeichnisses - Freigabe …). Alternativ über die Kommandozeile (für englisches Windows Jeder->Everyone):

```
> icacls c:\git_server /grant Jeder:(f)
```

## SSH

Um den Zugriff auf das Remote-Repo zusätzlich zu steuern kann mittels SSH gearbeitet werden. Dazu wird im eigenen SSH-Verzeichnis (üblich ist `c:\users\myUser\.ssh\`) die Datei *authorized_keys* angelegt. In dieser Datei werden die öffentlichen Schlüssel (id_rsa.pub) der berechtigten Benutzer abgelegt.  
authorized_keys:

Um ssh zu verwenden müssen die Anwender das Remote-Repo in dieser Form angeben:

```
> git clone git@gitserver:c:/git_server/myProject.git
```

## Referenzen

- Git-Server für Windows Einrichten  
<https://medium.com/@piteryo7/how-to-set-up-git-server-on-local-network-windows-tutorial-7ec5cd2df3b1> 
- SSH einrichten  
<https://git-scm.com/book/de/v1/Git-auf-dem-Server-Einrichten-des-Servers> 