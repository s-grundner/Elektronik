## Gitlab

### Vorbereitung

Für *GitLab* wird ein SSH-Schlüssel benötigt. Dafür muss, wenn ein für einen neu angelegten Benutzer ein neues Projekt erstellt wird, ein Schlüssel generiert und eingegeben werden. Dazu:

- SSH-Schlüssel erzeugen mittels `ssh-keygen` in der Kommandozeile. Dabei wird ein passender Schlüssel in `c:\users\xxxxxx\.ssh\id_rsa.pub` generiert (in aktuellen Versionen von Windows 10 ist OpenSSH als APP direkt aktivierbar).
- Alternativ dazu kann zum Beispiel im Windows-Explorer im Kontext-Menü des .Git-Verzeichnisses Git-Gui gestartet werden und darin in Help->Show SSH ein Key generiert werden.
- Dieser Key wird komplett kopiert und in Gitlab unter User Settings->SSH-Keys eingefügt.

### Projekt Teilen

Beim Erstellen eines Projekts wird das Projekt auf *private* gesetzt. Dadurch wird das Projekt nicht automatisch für jedermann zugreifbar.

Wird ein Projekt mit jemanden geteilt wird in den Projekteinstellungen unter Members der entsprechende Anwender für das aktuelle Projekt dazugefügt. Dabei kann der Anwender mittels Gitlab-User oder einer Mail-Adresse angeführt werden. Dabei wird auch die Rolle eingestellt: <https://docs.gitlab.com/ee/user/permissions.html>

Für Benutzer die Code auch verändern können sollen ist zumindest die Rolle *Reporter* notwendig (via Branch und Merge - Details siehe Link). Um direkt im *main*-Branch Änderungen tätigen zu können muss zumindest die Rolle *Maintainer* zugeteilt sein.