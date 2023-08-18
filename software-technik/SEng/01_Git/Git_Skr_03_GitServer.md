# 3 Git - Lokaler Server

Sollen Git-Repos selbst gehostet werden (Firmen-Interna auf GitLab?!), dann muss ein Server aufgesetzt werden.

## Remote- und Lokales-Repo auf einem Rechner

Voraussetzung: git-for-windows

- Ordner Erstellen (Groß-/Kleinschreibung, Sonderzeichen, Leerzeichen ... bewusst einsetzen)

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

Damit in einem lokalen Netz (Schulrechner, Heimnetzwerk, Firmennetzwerk ...) gearbeitet werden kann, muss das *git_server*-Verzeichnis mittels Netzfreigabe (für entsprechende Benutzer) zugreifbar gemacht werden (Kontext-Menü des Verzeichnisses - Freigabe ...). Alternativ über die Kommandozeile (für englisches Windows Jeder->Everyone):

```
> icacls c:\git_server /grant Jeder:(f)
```

## SSH

Um den Zugriff auf das Remote-Repo zusätzlich zu steuern kann mittels SSH gearbeitet werden. Dazu wird im eigenen SSH-Verzeichnis (üblich ist `c:\users\myUser\.ssh\`) die Datei *authorized_keys* angelegt. In dieser Datei werden die öffentlichen Schlüssel (id_rsa.pub) der berechtigten Benutzer abgelegt.
authorized_keys:

```
ssh-rsa DDDDB3NzaC1yc2EAdAADAQABAAABAQCB007n/ww+ouN4gSLKssMxXnBOvf9LGt4L
ojG6rs6hPBd9j9R/T17/x4lhJA0F3FR1rP6kYBRsWj2aThGw6HXLm9/5zytK6Ztg3RPKK+4k
Yjh6541NYsnEAZuXz0jTTyAUfrtU3Z5XXXXC4oxOj6H0rfIF1kKI9MAQLMdpGW1GYEIgS9Ez
Sdfd8AcCIicTDdbqLAcU4UpkaX8KyGlLwsNuuGztUUU8m72ALC/nLF6JLtPofwFBlgc+myiv
O7TCUSBdLQlgMVOFq1I2uPWQOkOWQAHukEOmfjy2jctxSDBQ220ymjaNsHT4kgtZg2AYYgPq
dAv8JggJICUvax2T9va5 jonny@hisNotebook
ssh-rsa DDDDB3Nzasdfa2EAdAADAQABAAABAQCB007n/ww+ouN4gSLKssMxXnBOvf9LGt4L
ojG6rs6hPBd9j9R/T17/xasdfasdfFR1rP6kYBRsasasdfadsHXLm9/5zytK6Ztg3RPKK+4k
Yjh6541NYsnEAZuXz0jTTyAUfrtU3Z5XXXXC4oxOj6H0rfIF1asdfadsLMdpGW1GYEIgS9Ez
Sdfd8AcCIicTDdbqLAcU4UpkaX8KyasdasdfadsfUUU8m72ALC/nLF6JLtPofwFBlgc+myiv
O7TCUSBdLQlgMVOFq1I2uPWQOkOWQAHukEOmfjy2jctxSDBQ220ymasdadsfadfZg2AYYgPq
dAv8JggJICUvax2T9va5 claudia@herDesktop
```

Um ssh zu verwenden müssen die Anwender das Remote-Repo in dieser Form angeben:

```
> git clone git@gitserver:c:/git_server/myProject.git
```

## Referenzen

- Git-Server für Windows Einrichten
  https://medium.com/@piteryo7/how-to-set-up-git-server-on-local-network-windows-tutorial-7ec5cd2df3b1 
- SSH einrichten
   https://git-scm.com/book/de/v1/Git-auf-dem-Server-Einrichten-des-Servers 