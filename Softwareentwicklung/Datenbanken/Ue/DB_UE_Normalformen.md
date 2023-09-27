# 2 Normalformen - Übungen

## Projektverwaltung

In welcher Normalform befindet sich die folgende Tabelle (Begründung)? Bringen Sie die folgende Tabelle in die nächst-höhere(n)-Normalform(en):

![Projekt](../assets/NF_Projekt_01.png)

- PNr ist die Personalnummer - ist eindeutig zugeordnet
- Eine Person ist fest einer Abteilung zugeordnet
- Abteilungsnummer und Abteilungsnummer gehören zusammen
- Personen können an mehreren Projekten arbeiten
- Mehrere Personen können am gleichen Projekt arbeiten

(Beispiel von <https://www.youtube.com/watch?v=RfjMGFPiyps)>

## Fahrradgeschäft

Bringen Sie die folgende Tabelle nacheinander in die 1te, 2te und 3te Normalform:

![Fahrrad](../assets/NF_Fahrrad_01.png)

Fragen die vorab überlegt werden müssen (Expertenwissen)

- Kann ein Kunde mehrere Rahmen haben/kann ein Rahmen mehreren Kunde gehören/gehört haben?
- Kann ein RahmenNr mehrere Marken haben oder umgekehrt?
- Ist ein Fahrrad immer bei der gleichen Versicherung versichert?
- Ist eine Versicherung immer an der gleichen Adresse?
- Können an einem Tag mehrere Reparaturen am gleichen Fahrrad, für den gleichen Kunden stattfinden?

> [!success] Lösung  
> ![Pasted image 20221123110050](../../../Mathe/assets/Pasted%20image%2020221123110050.png)

## CD-Lieder

Gegeben ist folgende Tabelle:

![CD-Lieder](../assets/NF_CD_01.png)

Führen Sie die Tabelle nacheinander in die 1te, 2te und 3te Normalform über

- Der gleiche Titel kann auf mehreren CDs sein
- Ein Interpret kann mehrere CDs herausbringen
- Ein Künstler/Band hat nur ein Gründungsjahr

> [!success] Lösung:
> 
> in die 1.NF durch Atomarisieren:
> 
> - Das Feld *Album* enthält den *Interpret* und den *Albumtitel*
> - Die Titelliste enthält mehrere *Titel* (können auch auf unterschiedlichen *Alben* vorkommen)
> - als Primär-Schlüssel wird *CdId* gemeinsam mit der *Track*-Nummer gewählt
> 
> ![CD-Lieder](../assets/NF_CD_02.png)
> 
> in die 2.NF durch funktional unabhängige Attribute:
> 
> - *Album/Interpret/Gründungsjahr* hängt nur von einem Teil des Primärschlüssels ab, von der *CdId*: **CdId → (Album, Interpret, Gründungsjahr)**
> - der *Titel* hängt von beiden Schlüsselteilen ab, mit einem alleine kann ein Titel nicht bestimmt werden: **CdId, Track → Titel**
> 
> ![CD-Lieder](../assets/NF_CD_04.png)
> 
> Transformation in die 3te Normalform:
> 
> ![CD-Lieder3](../assets/NF_CD_05.png)
> 
> - In der *Cd*-Tabelle zeigt sich: das *Gründungsjahr* der *Interpreten* ist nicht direkt von der *Cd*, sondern nur vom *Interpreten* abhängig (transitiv), das müsste noch in eine eigene Tabelle verschoben werden:
>   
>   - Cd: **CdId → (Album, InterpretenId)**
>   - Künstler: **InterpretenId → (Interpret, Gründungsjahr)**
>   
>   Um den Interpreten nicht in beiden Tabellen gleichermaßen abzulegen, wird der *Interpret* in die Künstlertabelle verschoben
> 
> ![CD-Lieder](../assets/NF_CD_03.png)

## Kurse

Normalisieren Sie folgende Tabelle bis in die 3te Normalform:

![Kurse](../assets/NF_Kurse_01.png)

- Kommt ein Teilnehmer immer von der gleichen Firma oder kann er Firma wechseln und wiederum Kurse machen?
- Kurstyp und Kursname sind eindeutig zugeordnet.

## Autovermietung

Für eine Autovermietung wurde ein ER-Diagramm erstellt und von einem Mitarbeiter wurde diese dann in die folgende Tabellen übertragen.

- Prüfen Sie die Qualität dieser Vorlage und
- gehen Sie dabei auf die Begriffe: Normalformen, Anomalien, Redundanzfreiheit, Funktionale Abhängigkeit, Minimalität des Schlüssels ein.

![Kurse](../assets/bsp_Autovermietung.png)

## Bibliothek

In einer Bibliothek werden folgende Daten erfasst:

- Bücher:  
  Titel: Fräulein Smillas Gespür für Schnee  
  Autor: Peter Høeg  
  Verlag: Carl Hanser  
  Ort: München  
  Jahr 1994  
  ISBN 3-499-13599-x  
  Preis 19,90  
  Exemplare 3  
  Zustand gut, sehr gut, gut  
  Standort Zimmer 3, Regal 5, Fach 7,7 und 8, Platz 3, 15,12

- Autoren:  
  Name Høeg  
  Vorname Peter  
  Land Dänemark  
  andere Buchtitel „Der Plan von der Abschaffung des Dunkels“

- Entleiher:  
  Name Meier  
  Vorname Peter  
  Geburtsdatum 24.4.1966  
  Straße Tegtmüllerweg 9  
  PLZ 80089  
  Ort München  
  Telefon (089) 383 245 12  
  Sperre keine

Überlegen Sie sich wie eine Datenbank in einer hohen Normalform organisiert werden kann.

## UNI-Verwaltungssystem

- Studenten besuchen Vorlesungen und machen mit Professoren Prüfungen darüber
- Ein Vorlesungsverzeichnis soll erstellt werden können.
- Eine Mitarbeiterliste soll erstellt werden können, gereiht nach Professor und seinen Assistenten.
- Professoren haben eine Einstufung und einen Raum
- Assistenten sind einem Professor zugeordnet
- Ein Inskriptionsverzeichnis: Welcher Student, welche Vorlesung(en) besucht)
- Ein Prüfungsverzeichnis: Welcher Student bei welchem Professor zu welcher Vorlesung wann, welche Note gemacht hat
- Eine Webanbindung (Vorlesungsverzeichnis) soll realisiert werden.
- Eine MS-Access / Openoffice base Anwendung zur Verwaltung der Daten und zur Berichterzeugung soll erstellt werden.

Fragen
------------------------------------------------------------

- Was versteht man unter Datenanomalie

- Was versteht man unter funktionaler Abhängigkeit

- Zuordnung der Begriffe Konsistenz/Redundanz den Beschreibungen "in verschiedenen Tabellen wird jeweils *ZUNAME*, *VORNAME*, *ADR*, … abgelegt" / "die *Postleitzahl* bestimmt automatisch auch die Attribute *Bundesland* und *Ort*"

- Was ist der Unterschied zwischen 1. Normalform, 2. Normalform und 3. Normalform

- Warum ist die Einhaltung der Normalformen so wichtig