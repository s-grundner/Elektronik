# 1 Git - Übungen

## Counter

Von einem einzelnen Entwickler wird ein c-Programm entwickelt. Das Programm ist mittels Git-Versionskontrolle zu entwickeln, die Entwicklungsschritte sind:

- Ausgangspunkt ist ein main.c mit "Hello World" Ausgabe (Version 1, "Start")
- Das Programm wird abgeändert um eine numerische int-Variable von 0 bis 10 zu inkrementieren und die Zahlen auszugeben (Version 2, "Step1")
- Anschließend wird das Programm abgeändert um die Zahlen bis zu einer einzulesenden Zahl auszugeben (Version 3, "Step2")

Stellen Sie anschließend einen Versionsbaum dar:

```
 > git log --graph --decorate --pretty=oneline --abbrev-commit
* 84f9c7b (HEAD -> master, origin/master) Step2, Wert Einlesen, Countdown Wert .. 0
* 983e5ca Step1, Countdown 10 .. 0
* 3e5607a Start, Say 'Hello world!'
```

Stellen Sie nacheinander in einem lokalen Verzeichnis jeden der Projektstände wieder her und Testen sie diesen auf Funktion.

## Taschenrechner

### Projekt Anlegen

- *GitLab*-Projekt *taschenrechner* anlegen

- Lokales Projekt-Verzeichnis *c:\taschenrechner*

- Mit Remote-Repo Verbinden:

  ```
  git clone origin git@gitlab.com:fosy/taschenrechner.git ./
  ```

- lokal *main.c* Erstellen:

  ```c
  #include <stdio.h>
  
  int main(int argc, char *argv[]) {
      return 0;
  }
  ```

- lokal *.gitignore* Erstellen (und je nach IDE Befüllen):

  ```
  build/*
  build/*/*
  *.cbp
  ```

- Erstellte Dateien ins Repo aufnehmen:

  ```
  git add .
  
  git commit -m "Initial Commit"
  
  git push origin master
  ```

### Projekt Teilen

Ab nun arbeiten zwei Entwickler am Projekt, der erste Entwickler implementiert eine Addition, der zweite Entwickler implementiert eine Division. Jeder Entwickler Startet mit dem oben erzeugten *master*-Branch und erstellt sich für seine Entwicklung einen Branch.

- Als Beispiel wird hier der Additions-Branch angeführt:

    ```
git branch addition
    ```
  
    Es wird auf den Branch gewechselt:

    ```
git checkout addition
    ```

- Einbau *add.c*, *add.h* und Anpassen von *main.c*.

- Aufnehmen ins lokale Repo und Branch auch auf dem Remote-Repo führen:

   ```
git add .
git commit -m "Implementation of Addition"
git push origin addition
   ```

Analog kann die Division eingebaut werden. Damit sieht der Verlauf so aus (in der Addition wurde ein zweiter *push* getätigt um einen Fehler zu korrigieren):

![img](bilder/git_ver09.png)

### Projekt Mergen

Die getätigten Änderungen müssen nun wieder in den Haupt-Branch (*master*) zusammengeführt werden.

- Beide Entwickler erstellen einen *Merge-Request* an. Dieser Merge-Request wird entweder direkt mit dem letzten *push* abgesetzt oder via Web-Interface auf *GitLab*. Der *Merge-Request* wird mit entsprechend notwendiger Information hinterlegt und an einen *Maintainer* gestellt (der hat ja die Rechte einen Merge durchzuführen).

- Der *Maintainer* erhält die *Merge-Requests* und Bearbeitet diese (Rückfrage ...). Dabei kann gewählt werden ob der Branch behalten werden soll (History) oder gelöscht wird.

- Das Hinzufügen der neuen Module *mult* und *add* kann einfach ge*mergt* werden. Für die Veänderung von *main.c* gibt es sehr schnell einen *Merge*-Konflikt. Dieser muss aufgelöst werden.

  --> es ist eine wesentliche Vereinfachung, wenn Änderungen nur an unterschiedlichen Dateien erfolgen.

Anschließend sieht der Verlauf etwa so aus:

![img](bilder/git_ver10.png)

3. Das *Mergen* erfolgt in diesem Beispiel direkt auf dem Remote-Repo. Die lokalen Repos werden dadurch nicht automatisch mitgezogen. Dafür muss auf dem *master*-Branch zurückgewechselt und das Repo heruntergezogen werden:

   ```
   git checkout master
   git pull origin master
   ```

   