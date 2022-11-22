# 3 Entity-Relationship-Modell (ERM) - Übungen

## Kurse

Erstellen Sie ein ER-Diagramm für folgende Anforderung:

- Die Mitarbeiter einer Firma können an einem Kurs teilnehmen
- Mitarbeiter hat PersNr, Name und Adresse
- Kurse haben eine KNr, einen Leiter und einen Termin

```ad-success
title: Lösung
![[htbluva_sbg_fsst/Db/Untitled Diagram.svg]]
```

## Projektdatenbank

Erstellen Sie ein ER-Diagramm für folgende Anforderung:

- Eine Abteilung führt Projekte aus
- Projekte haben eine Nr, Titel und Budget
- Abteilungen haben ein Kürzel und einen Namen
- Abteilungen sind hirarchisch orgranisiert (können (maximal eine) Oberabteilung haben)

``` ad-success
title: Lösung
![[htbluva_sbg_fsst/Db/Untitled Diagram 1.svg]]
```

## Kardinalitäten

Bestimmen Sie die Kardinalitäten der folg. Beziehungen:

| Kunden beauftragen Projekte                        | N:M |
| -------------------------------------------------- | --- |
| Firmen erzeugen Produkte                           |     | 
| Mitarbeiter sind einer Abteilung zugeordnet        |     |
| Ein Schüler geht in eine Klasse                    |     |
| Studierende besuchen eine oder mehrere Vorlesungen |     |
| Schüler entlehnen Bücher in der Bibliothek         |     |
| Ein Mitarbeiter leitet ein Projekt                 |     |

```ad-success
title: Lösung
| Kunden beauftragen Projekte                        | N:M |
| -------------------------------------------------- | --- |
| Firmen erzeugen Produkte                           | N:M |
| Mitarbeiter sind einer Abteilung zugeordnet        | N:1 |
| Ein Schüler geht in eine Klasse                    | 1:1 |
| Studierende besuchen eine oder mehrere Vorlesungen | N:M |
| Schüler entlehnen Bücher in der Bibliothek         | N:1 |
| Ein Mitarbeiter leitet ein Projekt                 | 1:1 |
```


## Bibliothek

- Bücher:
  Titel:  Fräulein Smillas Gespür für Schnee
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
- Kunde:
  Name Meier
  Vorname Peter
  Geburtsdatum 24.4.1966
  Straße Tegtmüllerweg 9
  PLZ 80089
  Ort München
  Telefon (089) 383 245 12
  Sperre keine
  Ein Kunde kann ein Examplar kein Buch ausleihen
- Es kann mehrere Examplares eines Buches geben
- Standort eines Exemplares:
  Platz 3
  Fach 7
  Regal 5
  Zimmer 3
- Ein Kunde kann ein Buch ausleihen (unter Angabe von Datum und Bearbeiter)

Überlegen Sie sich wie eine Datenbank in einer hohen Normalform organisiert werden kann.

Variante:

- Eine Bibliothek besteht aus Büchern und Zeitschriften.
- Jedes Buch kann ggf. mehrere Autoren haben und ist eindeutig durch seine ISBN gekennzeichnet.
- Die Bibliothek besitzt teilweise mehrere Exemplare eines Buches.
- Zeitschriften dagegen sind jeweils nur einmal vorhanden. Sie erscheinen in einzelnen Heften und werden jahrgangsweise gebunden.
- Die in Zeitschriften publizierten Artikel sind ebenso wie Bücher einem oder mehreren Fachgebieten (z.B. Betriebssysteme, Datenbanksysteme, Programmiersprachen) zugeordnet.
- Ausgeliehen werden können nur Bücher (keine Zeitschriften).

```ad-success
title: Lösung
![[htbluva_sbg_fsst/Db/Untitled Diagram 2.svg]]
```

## Uni-Verwaltungssystem

- Es soll ein Uni-Verwaltungssystem gebaut werden. Dazu werden mehrere Personen interviewt:
- Professoren:
  Die Studierenden sollen bestimmte Lehrveranstaltungen hören (inskribieren) und über diese dann Prüfungen ablegen können.
- Verwaltungspersonal:
  Wir verwalten Professoren und deren Assistenten, wobei bei Professoren folg. Daten wichtig sind: Personalnummer, Name, Geburtsdatum, Raum, Rang.
  Professoren haben je ein eigenes Büro/Raum. Assistenten haben keinen Rang und eigenen Raum, bei ihnen wird das Fachgebiet gespeichert. Jeder Assistent ist genau einem Professor zugeordnet. Nur Professoren halten Vorlesungen ab. Über Vorlesungen werden folg. Daten gespeichert:
  Vorlesungsnummer, Titel, SWS (Semesterwochenstunden, ECTS).
  Manche Vorlesungen setzen den Besuch anderer Vorlesungen voraus und können ihrerseits wieder Voraussetzung für andere Vorlesungen sein.
  Es werden auch Studentendaten gespeichert: Matrikelnummer, Name, Geburtsdatum, Semester
  Zu den Prüfungen (Exam) muss gespeichert werden, welcher Student, bei welcher Vorlesung und bei welchem Professor welche Note (Grade), wann gemacht hat
- Ein Vorlesungsverzeichnis soll erstellt werden können
- Eine Mitarbeiterliste soll erstellt werden können, gereiht nach Professor und seinen Assistenten
- Ein Inskriptionsverzeichnis: Welcher Student, welche Vorlesung(en) besucht
- Ein Prüfungsverzeichnis: Welcher Student bei welchem Professor zu welcher Vorlesung, wann, welche Note gemacht hat
- Eine Webanbindung (Vorlesungsverzeichnis) soll realisiert werden
- Eine MS-Access / Openoffice base Anwendung zur Verwaltung der Daten und zur Berichterzeugung soll erstellt werden.

## Schule

Stellen Sie folgende Zusammenhänge in einem Schulinformationssystem als ER-Diagramm dar, und geben Sie an, ob es sich bei den Beziehungen jeweils um eine 1 : n- oder n : m-Beziehung handelt. Achten Sie auch auf die Festlegung der eindeutigen Identifikation.

Beschreibung:

- Von Schülern werden folgende Informationen gespeichert:
  Katalognr, Vorname, Nachname, Jahrgang, email
- Von Lehrern werden folgende Informationen gespeichert:
  Titel, Vorname, Nachname, email
- Von Abteilungen werden folgende Informationen gespeichert:
  Name, Abteilungsvorstand
- Von Schulen werden folgende Informationen gespeichert:
  Schulkennzahl, Name, Adresse (strasse, nr, PLZ, Ort), Direktor

Beziehungen: (non-identifiying     Relationship verwenden)

- Lehrer unterrichten Schüler.
- Schüler sind höchstens einer Abteilung zugeordnet. 
- Lehrer können in mehreren Abteilungen unterrichten. 
- Abteilungen, Lehrer und Schüler werden Schulen zugeordnet.

## Projektmanagement

Stellen Sie folgende Zusammenhänge in einem Projektmanagementsystem als ER-Diagramm dar, und geben Sie an, ob es sich bei den Beziehungen jeweils um eine 1:n- oder n:m-Beziehung handelt (ursprüngliche Entitytypen sind im Text bei ihrer ersten Nennung kursiv angegeben, in Klammern die Primärschlüssel).

- Ein Projekt (P-NR) besteht aus n Arbeitspaketen (A-NR), die jeweils einem Projekt eindeutig zugeordnet sind. Die Arbeitspakete sind untereinander zu einem hierarchischen Projektstrukturplan verbunden, wobei ein Arbeitspaket in mehrere weitere Arbeitspakete untergliedert werden kann, während jedes Arbeitspaket genau einem, hierarchisch übergeordneten Arbeitspaket untergeordnet ist.
- Jedem Arbeitspaket werden ein oder mehrere Mitarbeiter (SV-NR) zugewiesen, wobei Mitarbeiter auch in mehreren Arbeitspaketen beschäftigt sein können. Mitarbeiter weisen bestimmte Qualifikationen (Q-ID) auf und werden Abteilungen (A-ID) zugewiesen.
- Ein Arbeitspaket kann eine oder mehrere Qualifikationen erfordern.
- Jedes Projekt hat einen Mitarbeiter als Verantwortlichen, wobei allerdings ein Mitarbeiter auch für mehrere Projekte Verantwortung tragen kann.
- Führen Sie obiges ER-Modell in eine relationale Tabellendefinition über, wobei Sie zu jeder Tabelle den Primärschlüssel angeben.
- Kann ein Informationssystem, das auf diesem ER-Modell basiert, die Information liefern, welche Qualifikationen in Summe für die Abarbeitung eines Projektes notwendig ist?

## Arztpraxis

Verwenden Sie Normalisierung, um ein Datenbankschema für eine Arztpraxis zu entwerfen.

- Ein Arzt (Name, Fachrichtung, Adresse) behandelt Patienten (Name, GebDatum, Adresse ...)
- Patienten haben eine Krankenkasse (Name, Adresse ...)
- Ein Arzt erstellt eine Rechnung (RNr, Datum ...) die der Patient erhält
- Eine Rechnung setzt sich aus Rechnungsposten (Nr, Datum, Art, Kosten) zusammen

## Abteilung-Angestellte-Projekte (04)

1. Entitäten
   
   - Angestellter: Nummer, Gehalt, Name
   - Abteilung: Nummer, Name
   - Projekt: Nummer, Beschreibung

2. Beziehungen:
   
   - leiten (2x)
   - gehören zu
   - arbeiten an
   - sind Teilprojekte von
   - vertreten

3. Kardinalitäten
   
   - Jeder Angestellte gehört zu genau einer Abteilung
   - Jede Abteilung wird von genau einem Angestellten geleitet.
   - Zu einer Abteilung gehört mindestens ein Angestellter.
   - Ein Angestellter leitet höchstens eine Abteilung.
   - Jeder Angestellte arbeitet an mehreren Projekten
   - An einem Projekt arbeiten mehrere Angestellte.
   - Ein Projekt ist ein Teilprojekt von einem oder keinem anderen Projekt.
   - Ein Projekt kann beliebig viele Teilprojekte haben.
   - Ein Angestellter leitet mehrere Projekte.
   - Ein Projekt wird von genau einem Angestellten geleitet.
   - Jeder Angestellte hat genau einen Stellvertreter.
   - Jeder Angestellte ist Stellvertreter von genau einem anderen Angestellten.

a) Zeichnen Sie das Entity-Relationship-Diagramm.

b) Erstellen Sie die notwendigen SQL-Anweisungen

- Erzeugen der Tabellen (CREATE TABLE)
- Festlegen der notwendigen Schlüssel (Primär- und Fremdschlüssel)
- wenn eine Abteilung gelöscht wird sollen alle Mitarbeiter gelöscht werden
- er darf kein Angestellter eingestellt werden der keiner Abteilung zugeordnet werden kann
- listen Sie sämtliche Projekt auf für die aus der Abteilung "Development" zugearbeitet wird

## Referenzen

- Skriptum
  https://docplayer.org/32883339-02-arbeitsunterlagen.html
- Beispiel Biomed
  https://books.google.at/books?id=JwxWDwAAQBAJ&pg=PA26&lpg=PA26&dq=patient+erm+entit%C3%A4t&source=bl&ots=BvQD6JYSUR&sig=ACfU3U2L3dIUADb8K0J6YBbaF2gKpyoowA&hl=de&sa=X&ved=2ahUKEwjsuK_X4d3gAhUPExQKHTpqCTEQ6AEwD3oECAIQAQ#v=onepage&q=patient%20erm%20entit%C3%A4t&f=false
