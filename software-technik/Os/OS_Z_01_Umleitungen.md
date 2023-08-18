# Umleitungen

Streams/Kanäle der Konsole:

- stdin: Eingabe-Stream. Eingaben die in der Konsole getätigt werden, kommen in den stdin-Kanal des aktiven Programmes
- stdout: Ausgabe-Stream. "Normale" Ausgaben aus einem Programm werden in diesen Kanal geschrieben.
- stderr: Fehler-Stream. Wenn Fehler in einem Programm auftreten kann eine entsprechende Meldung in diesen Kanal ausgegeben werden. Dadurch ist es möglich Fehlermeldungen und "normale" Ausgaben voneinander getrennt zu behandeln.

## Umleiten der **stdout**-Ausgabe >

Um  **stdout**-Ausgaben aus einem Programm in die Konsole in eine Datei umzuleiten wird der **>** Operator verwendet:

```
befehl > datei
```

Existiert die Datei noch nicht wird sie angelegt. Wenn sie schon existiert wird sie überschrieben.

Werden aus dem Programm Ausgaben nach **stderr** ausgegeben, dann wird dieses Ausgabe nicht auch mit umgeleitet sondern wird weiter in der Konsole ausgegeben.

## Umleiten der **stderr**-Ausgabe >

Um  **stderr**-Ausgaben (Fehler-Ausgaben) aus einem Programm in die Konsole in eine Datei umzuleiten wird der **2>** Operator verwendet:

```
befehl 2> datei
```

Existiert die Datei noch nicht wird sie angelegt. Wenn sie schon existiert wird sie überschrieben.

Werden aus dem Programm Ausgaben nach **stdout** ausgegeben, dann wird dieses Ausgabe nicht auch mit umgeleitet sondern wird weiter in der Konsole ausgegeben.

Beide Ausgabekanäle können umgeleitet werden:

```
befehl >out.txt 2>fehler.txt
```

Sollen beide Ausgabekanäle in eine einzige Datei umgeleitet werden:

```
befehl >out.txt 2>&1
```

Wird zweimal der gleiche Dateiname angegeben, dann klappt's nicht (Datei besetzt).

## Umleiten von Ausgaben in Dateien und Anhängen >>

Sollen die oben erwähnten Ausgabeumleitungen an eine Datei angehängt werden, dann wird anstatt eines einfachen **>** Zeichens ein doppeltes angegeben:

```
befehl >> datei
```

Existiert die Datei, dann wird die Ausgabe an den Dateiinhalt angehängt. Wenn die Datei noch nicht existiert, dann wird sie erstellt.

## Umleiten von Eingaben <

Der Eingabe-Kanal **stdin** ist üblicherweise mit der Tastatur verbunden. Eingaben mittels Tastatur in der Konsole über **stdin** können mittels **<** auf Dateien umgeleitet werden:

```
befehl < datei
```

Damit werden geforderte Eingaben direkt aus *datei* bezogen.

## Pipe

Befehle (Programme) können direkt hintereinander ausgeführt werden. Dabei kann die Ausgabe des zuerst ausgeführten Programms direkt auf die Eingabe des zweiten Programmes umgeleitet werden:

```
befehl1 | befehl2
```

Zuerst *befehl1*, was immer dieser Befehl in **stdout** ausgibt wird in **stdin** abgelegt und ist in der Konsole nicht sichtbar. Anschließend wird *befehl2* ausgeführt.

## Referenzen

- https://de.wikibooks.org/wiki/Batch-Programmierung:_Batch-Operatoren#||
- https://wiki.ubuntuusers.de/Shell/Umleitungen/