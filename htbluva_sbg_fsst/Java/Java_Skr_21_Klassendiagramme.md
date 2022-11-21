# 21 Klassendiagramme

## Klassenblock

Ein Block stellt eine Klasse dar. Ein Block setzt sich aus drei Feldern zusammen: 

- Oberstes Feld: Klassenname
- Mittleres Feld: Membervariable
- Unterstes Feld: Membermethoden (einschließlich Konstruktor)

###Membervariable

Eine Membervariable wird mit führendem Zugriffsmodifizierer dargestellt. Es gibt vier Varianten:

- public: +

- private: -

- protected: #

- package: ~


nach dem Namen der Membervariable wird der Dateityp, getrennt durch einen Doppelpunkt angegeben.

### Membermethode

Für Membermethoden wird ebenfalls der Zugriffsmodifizierer angegeben, wie für die Membervariable. Zusätzliche Aufrufparameter können mit angegeben werden.

## Beziehungen

### Assoziation

Nicht näher spezifizierte Beziehungen werden durch eine durchgehende Linie ohne Pfeil und Beschriftung dargestellt.

### Generalisierung/Spezialisierung

Eine generalisierte Klasse wird mit einer durchgehenden Linie verbunden und einer dreieckigen Pfeilspitze die zur generalisierten Klasse hin zeigt.

![Vererbung](bilder/Klassendiagr_04.gif "Vererbung")

### Aggregation/Komposition

Aggregationen werden durch eine durchgehende Linie mit abschliessender und nichtausgefüllter Raute dargestellt. Die Darstelltung der Kompositionen ist gleich lediglich die Raute wird ausgefüllt. Die Raute ist in beiden Fällen auf Seite des Ganzen.


![Aggregation/Komposition](bilder/Klassendiagr_03.gif "Aggregation/Komposition")

### Multiplizität

In einer Beziehung kann auch die Anzahl der Verbindungen angegeben werden:

- konkrete Zahl, wenn eine klar definierte Anzahl von Verknüpfungen auf einer Seite gegeben ist
- geschlossener Bereicht n..m, wenn die Anzahl im Bereich n bis m liegen kann (einschl. n und m)
- offener Bereich n.., wenn die Anzahl im Bereich n bis beliebig groß sein kann
- Auflistung n;m;o wenn die Anzahl genau die Werte n, m, o usw. annehmen kann


![Multiplizität](bilder/Klassendiagr_02.gif "Multiplizität")

### Rolle, Beziehungsname und Richtung

Die Rolle wird nahe der Klasse angegeben und beschreibt die Rolle der Klasse in der Beziehung. Der Beziehungsname wird mittig über die Beziehung geschrieben und mit einem Pfeil für die Leserichtung eingetragen.

![Rolle, Beziehungsname und Richtung](bilder/Klassendiagr_01.gif "Rolle, Beziehungsname und Richtung")


