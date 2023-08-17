# Grafana

(raspi: https://www.youtube.com/watch?v=b0Ors2hJJ5s)

## Installation

- Download:
  https://grafana.com/grafana/download?pg=get&plcmt=selfmanaged-box1-cta1
  Installation ist einfach/gut beschrieben

## Konfiguration

- Anschließend (wenn Service gestartet) im Browser:
  http://localhost:3000
  Standard-Login: admin|admin
  Nach Login wird Passwortänderung gefordert admin|comein
- Benutzerdaten anpassen (Logo links-unten -> Preferences)
  Name, E-Mail, Usernam

## Datenquelle

Add Database-Source - hier zB InfluxDB wählen, dann die Datenquelle (localhost:8086 wenn auf dem gleichen Rechner)
(ttndb, fsst|comecomein) -> Save&Text -> OK

## Dashboard

Neues Dashboard -> darin Elemente für die Anzeige wählen, in InfluxDB ist der Vorteil, dass automatisch eine Zeitachse beinhaltet ist.





Vor der Verwendung muss der Dienst *Grafana* gestartet werden.



Für das erzeugte Dashboard kann mittels Teilen ein Link direkt für das Dashboard erzeugt werden mittels welchem direkt auf die Darstellung verlinkt wird.