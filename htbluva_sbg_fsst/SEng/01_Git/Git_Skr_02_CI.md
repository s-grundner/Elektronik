# 2 Git - CI/CD - Pipelines

CI = Continuous Integration
CD = Continuous Deployment/Delivery

Mit *CI* lassen sich in *GitLab* automatische Abläufe (Pipelines) generieren. Beispielsweise kann ein *Push* auf ein Remote-Repo einen Build, einen Test oder die Erstellung einer Doku auslösen. Erstellen einer Pipeline:

- In einem Git-Projekt, in der obersten Verzeichnis-Hierarchie

- Neue Datei erstellen *.gitlab-yi.yml*

- Beispielhaft 2 Stages (2 Stufen in der Pipeline): Build-Stage und Test-Stage
  .gitlab-ci.yml:

  ```
  stages:
   - build
   - test
  
  build:
   stage: build
   script:
    - echo "Building"
    - mkdir build
    - touch build/info.txt
  
  test:
   stage: test
   script:
    - echo "Testing"
    - test -f "build/info.txt"
  ```

  Achtung: es sind keine Tabs... erlaubt, Einrücken muss stimmen

  **stages:** dieser Abschnitt zeigt GitLab vorab wie die Pipeline aussieht. Hier werden sämtliche Pipe-Stages eingetragen.

  **build:** erster Pipe-Stage - folgend werden Optionen zu diesem Stage gesetzt, hier etwa
  
  - der Name (*stage: build*) und 
  - das Skript, das ausgeführt werden soll (script: ...)
  
  Allgemein: jeder Stage läuft in einem *Docker-Image* (Vorstellbar wie eine virtuelle Maschine). Wird es nicht anders angegeben, dann wählt GitLab das verwendete Image - aktuell Standard: Ruby-image
  
  **Ruby:** ist eine Skriptsprache (wird zur Laufzeit interpretiert)
  
  - `test -f`: Prüfung ob Datei existiert
  - `echo`: Ausgabe
  - `mkdir`: Direktory erstellen
  - `touch`: Datei erstellen (leer)
  
- `sh .myScript`: ausführen von Skripten (oben nicht dargestellt)
  

Damit ein Schritt als erfolgreich ausgeführt erkannt wird, muss er einen Return-Code 0 liefern (in Git-Bash mit *echo $?* prüfbar).



Wird das erstellte *.gitlab-ci.yml* auf das Remote-Repo gepusht, dann wird es automatisch von GitLab syntaktisch geprüft. Es muss die Meldung erscheinen: *This GitLab CI configuration is valid.* Ansonsten muss anhand der erhalteten Fehlermeldungen ein Fehler korrigiert werden.

In der Projekt-Übersicht ist ein Symbol (Kreissegment), dass anzeigt, dass "etwas läuft", wird draufgeklickt, dann wird eine Pipeline mit den definierten Stages dargestellt.

Der **GitLab-Runner** läuft nun und kommt für unser Beispiel hier zu einem *Successful* für *build* und einem *failed* für *testing*. Der Grund liegt darin, dass die Datei aus dem Build-Stage am Ende dieses Stages gelöscht wird und nicht mehr verfügbar ist (Stages sind unterschiedliche Jobs).

Lösung: der erste Job erstellt ein *Artefakt* und der Zweite kann das verwenden.

```
stages:
 - build
 - test

build:
 stage: build
 script:
  - echo "Building"
  - mkdir build
  - touch build/info.txt
 artifacts:
  paths:
   - build/

test:
 stage: test
 script:
  - echo "Testing"
  - test -f "build/info.txt"
```

Hier wird der gesamte im Stage erzeugte Ordner als Artefakt definiert (kann auch heruntergeladen werden), damit läuft die Pipeline durch.

## Images

In GitLab sind verschiedene Docker-Images verfügbar. (Wird das Git-Repo lokal verwaltet, dann kann eine selbst definierte Umgebung geschaffen werden.)

### gcc

Um gcc ausführen zu können muss **ruby:2.5** (eines von mehreren) geladen werden. Beispiel:

```
build:
 stage: build
 image: ruby:2.5
 script:
  - echo "Building"
  - mkdir build
  - gcc main.c func1.c func2.c -o build/tool
 artifacts:
  paths:
   - build/
```

### doxygen

Doxygen kann zum Beispiel mit dem Image **alpine:3.7** ausgeführt werden:

```
docu:
 stage: docu
 image: alpine:3.7
 script:
  - apk update
  - apk add doxygen
  - cd doxygen
  - doxygen Doxyfile
 artifacts:
  paths:
   - doxygen/documentation/html
```

Mit diesem Image können auf Tools nachgeladen werden (apk). Hier wurde im Doxyfile die Doku nach ./documentation/html entwickelt.

### Beispiel

main.c:

```c
#include <stdio.h>

int main() {
    printf("Hello World");
    return 0;
}
```

gitlab-ci.yml:

```
stages:
 - build
 - test
 - deploy

build:
 stage: build
 script:
  - echo "Building"
  - mkdir build
  - gcc main.c -o build/hello
 artifacts:
  paths:
   - build/

test:
 stage: test
 script:
  - echo "Testing"
  - ls build/
  - test -f "build/hello"
  - cd build
  - ./hello | grep "Hello World"

deploy:
  stage: deploy
  script:
   - echo "Deploying"
   - tar cfv archiv.tar main.c build/hello
   - gzip archiv.tar
  artifacts:
   paths:
    - archiv.tar.gz
```

- stage build: main.c wird als build/hello Erstellt, das Verzeichnis build (samt Inhalt) wird als Artefakt behalten
- stage test: es wird geprüft ob das im build-Stage erzeugte build/hello vorhanden ist und ob es "Hello World" ausgibt
- stage deploy: die erstellte build/hello Datei wird komprimiert als Artefakt freigegeben.



Sinn der Sache: es kann sichergestellt werden, dass ein Projekt unter Umständen generiert wird, die für sämtliche Entwickler ident ist. Gerade durch die Verwendung unterschiedlicher Betriebssysteme / Entwicklungsumgebungen können gefundene Teillösungen für machen Entwickler funktionieren, für andere eventuell nicht (kann von einem Entwickler alleine nicht sichergestellt werden). Mit einer zentralen Gesamtprojekt-Überwachung kann dem entgegengewirkt werden. Eine Forderung der agilen Software-Entwicklung: Das Gesamt-Projekt muss immer lauffähig sein wird damit unterstützt.

## Referenz

- Video:
  https://www.youtube.com/watch?v=Jav4vbUrqII