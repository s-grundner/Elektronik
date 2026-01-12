---
tags:
  - OS
  - Cpp
aliases: []
created: 29. November 2022
---

# 3 Os - Synchronisation - Cpp

Häufig müssen parallel laufende Threads miteinander synchronisiert werden (Ablauf aufeinander abgestimmt).  
Das kann durch die Nutzung gemeinsamer Betriebsmittel, Datenbereichen oder beim Austausch von Information notwendig sein.  
In vielen Fällen ist der gleichzeitige Zugriff auf Betriebsmittel nicht zulässig oder kann Fehler verursachen (siehe weiter unten).

Wenn der Zugriff nicht geregelt wird, dann kann es zu sogenannten **Data-Races** kommen.  
Damit ist gemeint, dass jeder Thread versucht, seine Operationen so schnell wie möglich zu erledigen, ohne die Organisation des Gesamt-Prozesses.  
Da sich der Ablauf dadurch zwangsläufig "eher sporadisch" verhält, sollten Data-Races vermieden werden und der Zugriff auf geteilte Ressourcen organisiert werden (Fehler durch Data-Races sind oft sehr schwer zu finden).

Zum Vermeiden von Data-Races in C++:

- [Sperr-Synchronisation](Mutex.md) mittels [Mutex](Mutex.md)
- Bedingungsvariable (Condition Variables)

Eine Möglichkeit Data-Races zu vermeiden, kann mittels **Bedingungsvariablen** erreicht werden. Dabei kann ein Thread Bedingungsvariable entsprechend setzen. Genaugenommen verhindert diese Art keine Data-Races, sondern vermeidet die Ursache dafür (gleichzeitig genutzte Resource). Ein Konzept wie sie tatsächlich verhindert werden können ist die **Sperrsynchronisation**.

- [Sperr-Synchronisation - Mutex](Mutex.md)  
- [Signal-Synchronisation - Semaphore](Semaphore.md)
- [Ereignis-Synchronisation](Ereignis-Synchronisation.md)

## Zusammenfassung

Beherzigen Sie folgende Regeln bei der Synchronisierung von Threads:

- Nie Resourcen anfordern, wenn gleichzeitig schon welche besetzt werden.
- Sicherstellen, dass eine Resourcen-Sperre in jeden Fall freigegeben wird.

## Fragen

- Warum sollen Threads synchronisiert werden (sollen sie/wann/warum)?
- Was versteht man unter einem Data-Race (gut/schlecht)?
- Auf welche Arten können Prozesse in synchronisiert werden?
- Was versteht man unter Threadsafe?
- Was bedeutet Lost-Update?
- Erklären Sie das Producer/Consumer-Problem?
- Zeigen Sie wie Deadlocks trotz (schlechter) Sperrsynchronisation passieren können?

# Referenzen

- [Java](../Java/{MOC}%20Java.md)-Semaphore/Mutex  
  https://www.mkyong.com/java/java-thread-mutex-and-semaphore-example/