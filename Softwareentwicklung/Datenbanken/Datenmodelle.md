---
tags:
aliases:
subject:
  - Datenbanken und Informationssysteme 1
  - VL
semester: WS26
created: 5th October 2026
professor:
release: false
title: Datenmodelle
---

# Datenmodelle

Definition von Datenobjekten und die beziehung zwischen einander. 

> [!info] Datenfelder $\iff$ Attribute

## Teilsprachen

- DDL: Data Definition Language
	- Defintion
	- Deklaration
- DML: Data Manipulation Language
	- Abfragen: Query Language
	- Änderungen: Manipulation Language

> [!example] Beispiele
> - `CREATE TABLE` $\to$ DDL
> - `INSERT INTO` $\to$ DML

## Konzeptioneller Entwurf

- Diese Modelle verfügen im Allgemeinen nur über eine DDL. Sie verzichten auf die
- Abbildung individueller Datenobjekte, benötigen also keine DML.
- **[Entity-Relationship-Modell (ER-Modell)](Entity-Relationship-Modell.md)**
- Semantisches Datenmodelle
- Objektorientierte Entwurfsmodell

## Logischer Entwurf

- **Relationales Datenmodell**
- Objektorientiertes Datenmodell
- Deduktives Datenmodell
- Hierarchisches Datenmodell / Netzwerkmodell (historisch)

## Datenbankschema

Das **Datenbankschema** beschreibt die Struktur der in einer Datenbank gespeicherten Datenobjekte. In objektorientierten Datenmodellen umfasst es zusätzlich die Beschreibung ihres Verhaltens, beispielsweise in Form von Operationen oder Methoden.

- Das Schema enthält somit keine konkreten Datenobjekte, sondern legt fest, wie diese strukturiert sein müssen und welche Beziehungen zwischen ihnen zulässig sind. Es kann daher als eine Form von Metadaten, also Daten über Daten, verstanden werden.

> [!info] Schemaevolution
>  Änderungen am Datenbankschema werden als Schemaevolution bezeichnet. Dabei kann es beispielsweise notwendig sein, Tabellen, Attribute, Beziehungen oder Integritätsbedingungen zu ergänzen, anzupassen oder zu entfernen.

## Datenbankausprägung

Die **Datenbankausprägung** bezeichnet den zu einem bestimmten Zeitpunkt gültigen Inhalt beziehungsweise Zustand der Datenbasis.

- Sie umfasst alle tatsächlich gespeicherten Datenobjekte und muss den durch das Datenbankschema vorgegebenen Struktur- und Integritätsbedingungen entsprechen.

In diesem Zusammenhang wird zwischen zwei Ebenen unterschieden:

- **Intensionale Ebene:** das Datenbankschema, also die Beschreibung der Datenstruktur.
- **Extensionale Ebene:** die Datenbankausprägung, also die konkreten gespeicherten Daten.