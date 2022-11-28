# Wiederholung C

## Arrays und Strings
### Primzahlen – Sieb des Eratosthenes (066)

Primzahlberechnung nach dem Sieb-Verfahren: Schreiben Sie alle Zahlen (z.B. von 2 bis 100) in ein Array. Beginnend mit der kleinsten Zahl wird die Zahl als Primzahl auf dem Bildschirm ausgegeben und gleichzeitig alle Vielfachen dieser Zahl im Array auf 0 gesetzt d.h. aus der Liste gestrichen. Anschliessend wird die nächste Zahl ungleich 0 im Array bearbeitet.
### str2bin (011)
Ein Integer in binärer Form dargestellt - also mit der Basis 2 – gibt den Wert als Bitmuster aus 0 und 1 wieder. Schreiben Sie die Funktion  **str2bin**, die einen String bestehend aus aneinander gereihten 0er und 1er entgegen nimmt und einen **vorzeichenlosen Integerwert** zurück liefert, der dem Wert des mit dem String beschriebenen Bitmusters entspricht. Schreiben Sie die Funktion so, dass sie sowohl auf 16, 32 oder 64 Bit-Systemen verwendet werden kann. Berücksichtigen Sie eine etwaige Fehlerbehandlung.
### ArrAuth (067)
gegeben sind:
int zahlen[] = {12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

char fragen\[\]\[81\] = {
"Zahl4 * Zahl2 + Zahl1 = ?",
"Zahl3 * Zahl2 - Zahl8 = ?",
"Zahl7 * Zahl2 + Zahl9 = ?",
"Zahl1 * Zahl4 + Zahl3 = ?",
"Zahl3 * Zahl2 + Zahl6 = ?",
"Zahl7 * Zahl5 - Zahl8 = ?",
"Zahl4 * Zahl10 - Zahl12 = ?",
"Zahl3 * Zahl11 - Zahl3 = ?",
"Zahl8 * Zahl7 + Zahl6 = ?",
"Zahl5 * Zahl2 - Zahl9 = ?",
"Zahl2 * Zahl3 - Zahl1 = ?",
"Zahl7 * Zahl8 + Zahl2 = ?"
};

1.  Erstellen Sie die Funktion
    int getAntwort(int zahlen[], int len, char frage[]);
    @param zahlen Array mit Zahlenwerten (s.o), 
    @param len mit Anzahl der Arrayelemente
    @param frage eine einzelne Frage (Aufbau einer Frage s.o.)
    @return die berechnete Zahl
2.  Erstellen Sie ein Testprogramm, das die Lösungen der Fragen (im Array fragen) in folgendes Array schreibt.

  int antwort[12];

  Verwenden Sie die Funktion aus 1.

### Buchstabenmischen (080)
Erkennen von Wörten mit Buchstabenmix

Aus einer Email:
------------- Begin Forwarded Message-------------
Nach eienr Stidue der Cmabridge Uinverstiaet,ist es eagl in wlehcer Reiehnfogle die Bchustebaen in Woeretrn vokrmomen.Es ist nur withcig, dsas der ertse und lettze Bchusatbe an derricthgien Stlele snid. Der Rset knan total falcsh sein und man knan es onhe Porbelme leesn. Das ist, wiel das mneschilche Geihrn nciht jeden Bchustbaen liset sodnern das Wrod als gaznes. Krsas oedr?
------------- End Forwarded Message-------------

Schreiben Sie Programm, das diesen Sachverhalt testet: ausgehend von einem Text mit mehreren Worten soll es einen neuen Text generieren, in dem Satzzeichen und die Anfangs- und Endbuchstaben aller Worte unverändert übernommen werden, während die Buchstaben im Wortinneren beliebig permutiert werden.

Entwerfen Sie für diesen Permutationsoperator eine Funktion, die diese Aufgabe für ein Wort leistet. Beachte dabei, dass auch Teilstrings mit \0 terminiert werden müssen.

Im obigen Beispiel wurden übrigens nur paarweise manchmal Buchstaben im Wort vertauscht. Dieser beschränkte Vertauschoperator produziert keine stark verfremdeten Wörter, sondern erhält grosse Teile der Wortstruktur. Implementiere auch diesen Operator und stelle das Ergebnis beider Operatoren gegenüber.

Extraarbeit: Versehen Sie Ihr Programm mit einem kleinen DOS-Menü, dass den Text (max. 500 Zeichen) einlesen und auf Wunsch in verschiedenen Varianten ausgibt.

### Wörter kürzen - removeVovel (081)

Sprachwissenschaftler sind der Ansicht, dass auch nach dem Entfernen von Vokalen der Text noch lesbar bleibt. Schreiben Sie eine Funktion  void removeVovel(char s[]), die aus einem Text s die Vokale entfernt. Stimmt es, was die Wissenschaftler sagen?

### Stringausgabe (082)

Folgender C-Code ist gegeben:

```c
char str[128+1];
strcpy(str , "Hallo");
printf("<%s>strlen=<%i>sizeof=<%i>\n", str, strlen(str), sizeof(str));
```

Welcher Text wird mit printf auf stdout ausgegeben?

## Matrizen

### Minimale Spaltensumme Ermitteln (068)

Schreiben Sie eine Funktion **minsumcol**, die eine 2-dimensionale Matrix mit der Dimension 8 Zeilen und 10 Spalten gefüllt mit positiven ganzzahligen Werten entgegennimmt. Berechnen Sie von allen Spalten die Summe. Die Funktion soll als Ergebnis den Index jener Spalte der kleinsten Spaltensumme liefern. Im Fehlerfall soll ein negativer Wert zurück gegeben werden. Sollten mehrere Spalten das Minimum bilden, so ist dies wie ein Fehler zu behandeln.

### Teste auf Untere Dreiecksmatrix (069)

Schreiben Sie ein Programm, dass testet, ob eine Matrix eine untere Dreiecksmatrix ist. Das bedeutet, dass über der Hauptdiagonale nur 0en stehen dürfen. Der Rest ist beliebig. Die Matrix muss quadratisch sein.

### Zufallsgüte-Test (072)

C verfügt über eine Bibliotheksfunktion (rand()), die Zufallszahlen generiert. Untersuchen Sie wie gut (d.h. zufällig) diese Funktion tatsächlich ist.

Stellen Sie die Gleichverteilung der Zufallszahlen dar, erstellen Sie dazu ein Histogramm das darstellt wie häufig jede Zahl berechnet wurde.

Zusätzlich sind die folgenden Werte zu berechnen und auszugeben:

- Minimum,
- Maximum,
- Durchschnitt,
- Standardabweichung

Beispielhafte Ausgabe:

```
....
32755: ***********
32756: ****
32757: **********
32758: *********
32759: ***********
32760: *************
32761: ***********
32762: ******
32763: *******
32764: ********
32765: *****
32766: ************
Minimum           : 0
Maximum           : 25
Durchschnitt      : 10.000000
Standardabweichung: 3.302428
```

### Hangman (070)

Realisieren Sie das bekannte Wortratespiel auf dem Computer.

Zeigen Sie zunächst von einem zu ratenden Wort für die einzelnen Zeichen jeweils nur Striche an.

Anschließend fragen Sie nach Buchstaben. Sollten die Buchstaben im zu ratenden Wort vorkommen, so werden die entsprechenden Positionen aufgedeckt, d.h. an dieser Stelle werden die tatsächlichen Zeichen angezeigt. Durch Eingabe eines Zeichens (z.B. '#' – welches dann in keinem Wort vorkommen darf) kann das Raten abgebrochen werden und die Eingabe des vollständigen Worts ist nun möglich. Stimmt das eingegebene Wort mit dem verdeckten Wort überein, ist das Spiel zu Ende, ansonsten wird wieder in den obigen Buchstabenratemodus zurückgekehrt.

 Beispiel: Zu ratendes Wort:"Hangman" (verdeckt)

\- - - - - - -     Eingabe (a)

\- a - - - a -    Eingabe (g)

\- a - g - a -    Eingabe (e)

\- a - g - a -    Eingabe (n)

\- a n g - a n   Eingabe (#) ~ Ende Buchstabenraten

Eingabe: Hangman →  richtig geraten / bzw. Zurückkehren zum Buchstabenraten

Hinweis:
Sie können das Spiel abwechslungsreicher gestalten, wenn Sie sich eine Tabelle von zu ratenden Wörtern im Programm anlegen und aus dieser Tabelle zufällig einen Eintrag auswählen, anstatt diesen vorher einzugeben.

### Feld und Zeiger (090)

Was gibt das folg. Programm aus?

```c
int a[] = {111, 222, 333, 444, 555};
int *p;

p = &a[1];
int x = *p + 2;  
p++;
int y = *(p + 2); 

printf("x = %i y = %i", x, y);
```

Ausgabe:
x = <u>                                                                                                        .</u> 

y = <u>                                                                                                        .</u> 

## Dateizugriff

### Passwörter (035)
* Gegeben ist die Datei passwd (s.u.)
* Lesen Sie die Datei ein und geben Sie die größte UID aus.

Hinweis: UID
Die UID ist das 3. Feld (Feldtrennzeichen ist der :)
sync hat z.B.: die UID 4

Hinweis:
```c
char * strtok(char *string, char *delimiters);
char string[] = "Kurt,Kanns;555678;DE";
char delimiter[] = ",;";
char *ptr;

// initialisieren und ersten Abschnitt erstellen
ptr = strtok(string, delimiter);

while(ptr != NULL) {
	printf("Abschnitt gefunden: %s\n", ptr);
	// naechsten Abschnitt erstellen
 	ptr = strtok(NULL, delimiter); //2ter Aufruf: NULL statt string
}
```
Beispielhafte Ausgabe:
```
Abschnitt gefunden: Kurt
Abschnitt gefunden: Kanns
Abschnitt gefunden: 555678
Abschnitt gefunden: DE
```

Datei passwd:

```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
libuuid:x:100:101::/var/lib/libuuid:/bin/sh
mysql:x:101:103:MySQL Server,,,:/nonexistent:/bin/false
avahi-autoipd:x:102:105:Avahi autoip daemon,,,:/var/lib/avahi-autoipd:/bin/false
messagebus:x:103:107::/var/run/dbus:/bin/false
colord:x:104:108:colord colour management daemon,,,:/var/lib/colord:/bin/false
usbmux:x:105:46:usbmux daemon,,,:/home/usbmux:/bin/false
Debian-exim:x:106:114::/var/spool/exim4:/bin/false
statd:x:107:65534::/var/lib/nfs:/bin/false
hofmann:x:1000:1000:hofmann,,,:/home/hofmann:/bin/bash
```

### Tore Zählen (036)

Gegeben ist die Datei tore.txt (s.u.). Lesen Sie die Datei ein und geben Sie die Anzahl der insgesamt erzielten Tore aus.

Datei tore.txt:

```
4
groedig:salzburg:0:0
frankfurt:stuttgart:4:5
gladbach:bayer:0:0
real:barca:3:1
```

### OPEN DATA und SALZBURG (wlanhotspots) (037)

PROGRAMM-NAME: opendata-salzburg-wlanhotspot-osm.c

- Laden Sie die Datei *wlanhotspot.csv* aus Ihrem Programm von https://www.data.gv.at/katalog/dataset/salzburg-surft-hotspot-standorte/resource/70540bd6-1354-44bc-ac22-fc954766c640
  Hinweis: Verwenden Sie bitsadmin (windows-tool), wget, curl bzw. ....
  z.B.:

  ```
  system("bitsadmin /transfer wcb /priority high "http://data.stadt-salzburg.at/geodaten/wfs?service=WFS&version=1.1.0&request=GetFeature&srsName=EPSG:4326&outputFormat=csv&typeName=ogdsbg:wlanhotspot" \"%cd%\\wlanhotspot.csv\"");
  ```

  (wget gibts unter http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe)

- Lesen Sie die Datei *wlanhotspot.csv* ein und erstellen Sie die Datei *wlanhotspot.txt* (siehe Muster weiter unten).

- Laden Sie mit Ihrem Webbrowser die Datei *index.html* und testen Sie die Funktionalität. Die Datei *wlanhotspot.txt* muss sich dabei im gleichen Ordner befinden.
  Tipp: Achten Sie auf den richtigen Aufbau (Tabulator, Zeilenumbruch am Ende ...) der Datei *wlanhotspot.txt*.

#### HINWEIS: wlanhotspot.txt, index.html, wlanhotspot.csv

- Studieren Sie: http://wiki.openstreetmap.org/wiki/Openlayers_POI_layer_example
- Laden Sie die Dateien in einen eigenen Unterordner: 
  index.html
  wlanhotspot.txt
  Ol_icon_blue_example.png
  Ol_icon_red_example.png

wlanhotspot.csv (falls kein Internet)

```csv
FID,ID,GEOMETRIE,STANDORTNAME,HOMEPAGE,BEMERKUNG
wlanhotspot.gisdb.37366,gisdb.37366,POINT (13.00539148942703 47.81019615705138),Salzburg surft Hotspot - SWH Taxham,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37367,gisdb.37367,POINT (13.021817535399212 47.8241462764178),Salzburg surft Hotspot - SWH Liefering,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37368,gisdb.37368,POINT (13.048104501836296 47.823142057949234),Salzburg surft Hotspot - SWH Itzling,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37369,gisdb.37369,POINT (13.060087135964498 47.79063964566402),Salzburg surft Hotspot - SWH Hellbrunn,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37370,gisdb.37370,POINT (13.027040198811637 47.813599440328474),Salzburg surft Hotspot - Stadt-Bibliothek Salzburg,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37371,gisdb.37371,POINT (13.026458422130995 47.83067003663601),Salzburg surft Hotspot - Sportzentrum Nord,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37372,gisdb.37372,POINT (13.067881930834693 47.77668987072964),Salzburg surft Hotspot - Sporthalle Alpenstraße,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37373,gisdb.37373,POINT (13.063694996283205 47.76378997534246),Salzburg surft Hotspot - Schloss Hellbrunn,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37374,gisdb.37374,POINT (13.027351340015988 47.81331845653042),Salzburg surft Hotspot - Panorama-Bar,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37375,gisdb.37375,POINT (13.047768184887957 47.79882736625742),Salzburg surft Hotspot - Mozartplatz,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37376,gisdb.37376,POINT (13.043215698795352 47.80530784532208),Salzburg surft Hotspot - Mirabellplatz,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37377,gisdb.37377,POINT (13.041738619671579 47.80518158973528),Salzburg surft Hotspot - Mirabellgarten,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37378,gisdb.37378,POINT (13.041843897148613 47.80545824867901),Salzburg surft Hotspot - Marmorsaal,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37379,gisdb.37379,POINT (13.046872325718192 47.797155336215546),Salzburg surft Hotspot - Kapitelplatz,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37380,gisdb.37380,POINT (13.05148570404941 47.79678056326994),Salzburg surft Hotspot - Kajetanerplatz,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37381,gisdb.37381,POINT (13.006419472691158 47.81086874809223),Salzburg surft Hotspot - JUZ Taxham,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37382,gisdb.37382,POINT (13.026203359480414 47.814989965388),Salzburg surft Hotspot - JUZ Lehen,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37383,gisdb.37383,POINT (13.019546104051273 47.7879726484369),Salzburg surft Hotspot - JUZ Komm,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37384,gisdb.37384,POINT (13.023505073079928 47.822042855302236),Salzburg surft Hotspot - JUZ JUKI,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37385,gisdb.37385,POINT (13.045909724584206 47.806421088081834),Salzburg surft Hotspot - JUZ IGLU,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37386,gisdb.37386,POINT (13.066092953864315 47.80728037620391),Salzburg surft Hotspot - JUZ get2gether,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37387,gisdb.37387,POINT (13.030146244927513 47.810220250243646),Salzburg surft Hotspot - Inge-Morath-Platz,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37388,gisdb.37388,POINT (13.071859621238303 47.776079166804635),Salzburg surft Hotspot - GSZ Süd,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37389,gisdb.37389,POINT (13.040467294404088 47.8229216804928),Salzburg surft Hotspot - CoWorkingSpace Salzburg,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37390,gisdb.37390,POINT (13.045649301329426 47.824700936393306),Salzburg surft Hotspot - BWS Itzling,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37391,gisdb.37391,POINT (13.061350832185438 47.80880076298528),Salzburg surft Hotspot - BWS Gnigl,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37392,gisdb.37392,POINT (13.080076975708641 47.78343372584447),Salzburg surft Hotspot - BWS Aigen,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37393,gisdb.37393,POINT (13.044662202159573 47.80210641626817),Salzburg surft Hotspot - BRICKS Music-Bar,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37394,gisdb.37394,POINT (13.040650105287133 47.80948722727082),Salzburg surft Hotspot - bivak.mobil,https://www.salzburgsurft.at/,
wlanhotspot.gisdb.37395,gisdb.37395,POINT (13.044713166100282 47.800070541374424),Salzburg surft Hotspot - Altes Rathaus,https://www.salzburgsurft.at/,

```

wlanhotspot.txt (erstellen aus csv-Datei):

```
lat	lon	title	description	icon	iconSize	iconOffset
48.0	9.1	Title One	Description one	Ol_icon_blue_example.png	24,24	0,-24
48.1	9.2	Title Two	Description two Ol_icon_red_example.png	16,16	-8,-8

```

index.html (Vorlage zum Testen):

```html
<html><body>
  <div id="mapdiv"></div>
  <script src="http://www.openlayers.org/api/OpenLayers.js"></script>
  <script>
    map = new OpenLayers.Map("mapdiv");
    map.addLayer(new OpenLayers.Layer.OSM());

    var pois = new OpenLayers.Layer.Text( "W-LAN Hotspots",
                    { location:"./wlanhotspot.txt",
                      projection: map.displayProjection
                    });
    map.addLayer(pois);
    var pois2 = new OpenLayers.Layer.Text( "Parkscheinautomaten",
                    { location:"./parkscheinautomaten.txt",
                      projection: map.displayProjection
                    });
    map.addLayer(pois2);
 // create layer switcher widget in top right corner of map.
    var layer_switcher= new OpenLayers.Control.LayerSwitcher({});
    map.addControl(layer_switcher);
    //Set start centrepoint and zoom
    var lonLat = new OpenLayers.LonLat( 13.03, 47.8 )
          .transform(
            new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
            map.getProjectionObject() // to Spherical Mercator Projection
          );
    var zoom=11;
    map.setCenter (lonLat, zoom);

  </script>
</body></html>
```

#### Erweiterung:

- Verändern Sie die Datei *index.html* dahingehend, dass beim Öffnen der Datei die Anzeige auf den Mittelwert der erstellten Punkte zentriert wird. Dazu müssen die Koordinaten in der folgenden Zeile angepasst werden:

  ```
  var lonLat = new OpenLayers.LonLat( 9.5788, 48.9773 )
  ```

- Erstellen Sie einen zweiten Layer mit den Parkautomaten der Stadt-Salzburg. Die Vorgangsweise ist wieder:

  - Die csv-Daten müssen von der Seite data.gv.at in eine lokale csv-Datei gespeichert werden
  - Schreiben der Koordinaten, Title und Description in eine Datei *parkscheinautomaten.txt* (Formatierung wie oben). Suchen und Verlinken Sie ein passendes P-Logo (24x24).
  - Einfügen eines neuen Layers in der Datei *index.html*.
  - Starten der Datei *index.html* im Browser.

### OpenDataTrack.c (037c)

Es ist eine GPS-Aufzeichnung in Form einer csv-Datei *fks.csv* vorhanden (siehe unten). Der resultierende *Track* ist in einer OpenData-Karte darzustellen. Es können lediglich *GPX*-Formate dargestellt werden, daher ist das csv-Format zu konvertieren. Als Beispiel für eine GPX-Datei ist die Datei *beispiel.gpx* gegeben.

Mit der *index.html* Datei wird das Ergebnis dargestellt.

fks.csv:

```
time;latitude;longitude;elevation
2017-01-01T08:12:51Z;46,586418;13,923359;555,000000
2017-01-01T08:13:24Z;46,586781;13,925720;563,000000
2017-01-01T08:14:57Z;46,587120;13,926850;569,000000
2017-01-01T08:15:30Z;46,587372;13,927240;572,000000
2017-01-01T08:16:03Z;46,587650;13,928000;578,000000
2017-01-01T08:17:36Z;46,588051;13,929750;579,000000
2017-01-01T08:18:09Z;46,588551;13,931470;578,000000
2017-01-01T08:19:42Z;46,588261;13,931890;576,000000
2017-01-01T08:20:15Z;46,588032;13,932050;575,000000
2017-01-01T08:21:48Z;46,587139;13,932430;565,000000
2017-01-01T08:22:21Z;46,586800;13,932640;561,000000
2017-01-01T08:23:54Z;46,586418;13,933310;563,000000
2017-01-01T08:24:27Z;46,585979;13,933670;564,000000
2017-01-01T08:25:00Z;46,585850;13,933890;568,000000
2017-01-01T08:26:33Z;46,585850;13,933800;566,000000
2017-01-01T08:27:06Z;46,585861;13,933890;568,000000
2017-01-01T08:28:39Z;46,586102;13,934020;568,000000
2017-01-01T08:29:12Z;46,586189;13,934140;568,000000
2017-01-01T08:30:45Z;46,586571;13,935030;575,000000
2017-01-01T08:31:18Z;46,586380;13,935190;578,000000
2017-01-01T08:32:51Z;46,586231;13,935430;587,000000
2017-01-01T08:33:24Z;46,586189;13,935742;589,000000
2017-01-01T08:34:57Z;46,586044;13,935318;586,000000
2017-01-01T08:35:30Z;46,585884;13,935108;585,000000
2017-01-01T08:36:03Z;46,585556;13,934977;584,000000
2017-01-01T08:37:36Z;46,584991;13,935169;585,000000
2017-01-01T08:38:09Z;46,584873;13,935415;588,000000
2017-01-01T08:39:42Z;46,584988;13,935889;595,000000
2017-01-01T08:40:15Z;46,584732;13,936401;598,000000
2017-01-01T08:41:48Z;46,584587;13,936542;598,000000
2017-01-01T08:42:21Z;46,584084;13,936808;601,000000
2017-01-01T08:43:54Z;46,583740;13,936858;605,000000
2017-01-01T08:44:27Z;46,583382;13,936645;603,000000
2017-01-01T08:45:00Z;46,582825;13,936573;610,000000
2017-01-01T08:46:33Z;46,582233;13,936580;610,000000
2017-01-01T08:47:06Z;46,581547;13,936895;620,000000
2017-01-01T08:48:39Z;46,581005;13,936949;617,000000
2017-01-01T08:49:12Z;46,580612;13,937103;614,000000
2017-01-01T08:50:45Z;46,579273;13,938390;614,000000
2017-01-01T08:51:18Z;46,578617;13,939126;613,000000
2017-01-01T08:52:51Z;46,577793;13,939846;590,000000
2017-01-01T08:53:24Z;46,577614;13,940168;582,000000
2017-01-01T08:54:57Z;46,577606;13,940597;585,000000
2017-01-01T08:55:30Z;46,577351;13,941160;573,000000
2017-01-01T08:56:03Z;46,577271;13,940600;574,000000
2017-01-01T08:57:36Z;46,577160;13,940440;570,000000
2017-01-01T08:58:09Z;46,577229;13,939570;569,000000
2017-01-01T08:59:42Z;46,577171;13,938790;564,000000
2017-01-01T09:00:15Z;46,576939;13,937350;558,000000
2017-01-01T09:01:48Z;46,576839;13,937090;557,000000
2017-01-01T09:02:21Z;46,576679;13,936940;557,000000
2017-01-01T09:03:54Z;46,576401;13,936910;558,000000
2017-01-01T09:04:27Z;46,575958;13,936990;558,000000
2017-01-01T09:05:00Z;46,575970;13,936870;558,000000
2017-01-01T09:06:33Z;46,575958;13,936990;558,000000
2017-01-01T09:07:06Z;46,574810;13,937150;559,000000
2017-01-01T09:08:39Z;46,574371;13,936930;559,000000
2017-01-01T09:09:12Z;46,573891;13,936380;559,000000
2017-01-01T09:10:45Z;46,571651;13,934230;558,000000
2017-01-01T09:11:18Z;46,571678;13,934090;558,000000
2017-01-01T09:12:51Z;46,570862;13,933320;558,000000
2017-01-01T09:13:24Z;46,570782;13,933410;559,000000
2017-01-01T09:14:57Z;46,567661;13,930360;561,000000
2017-01-01T09:15:30Z;46,567059;13,929530;559,000000
2017-01-01T09:16:03Z;46,566631;13,928620;562,000000
2017-01-01T09:17:36Z;46,566349;13,927670;564,000000
2017-01-01T09:18:09Z;46,566212;13,926700;566,000000
2017-01-01T09:19:42Z;46,566021;13,921250;559,000000
2017-01-01T09:20:15Z;46,565910;13,920320;560,000000
2017-01-01T09:21:48Z;46,567348;13,919120;554,000000
2017-01-01T09:22:21Z;46,568130;13,918360;554,000000
2017-01-01T09:23:54Z;46,568310;13,918060;554,000000
2017-01-01T09:24:27Z;46,568459;13,917600;555,000000
2017-01-01T09:25:00Z;46,568562;13,917010;555,000000
2017-01-01T09:26:33Z;46,568710;13,916935;555,000000
2017-01-01T09:27:06Z;46,569260;13,917350;553,000000
2017-01-01T09:28:39Z;46,569359;13,916540;553,000000
2017-01-01T09:29:12Z;46,569820;13,915510;554,000000
2017-01-01T09:30:45Z;46,569832;13,915010;554,000000
2017-01-01T09:31:18Z;46,569740;13,914420;554,000000
2017-01-01T09:32:51Z;46,569939;13,911470;554,000000
2017-01-01T09:33:24Z;46,569328;13,910030;555,000000
2017-01-01T09:34:45Z;46,569328;13,910030;555,000000
2017-01-01T09:35:18Z;46,569221;13,909260;555,000000
2017-01-01T09:36:51Z;46,569382;13,907970;555,000000
2017-01-01T09:37:24Z;46,569359;13,907380;554,000000
2017-01-01T09:38:57Z;46,569759;13,907280;554,000000
2017-01-01T09:39:30Z;46,569672;13,906930;553,000000
2017-01-01T09:40:03Z;46,569691;13,906200;554,000000
2017-01-01T09:41:36Z;46,569599;13,905690;557,000000
2017-01-01T09:42:09Z;46,569729;13,904650;558,000000
2017-01-01T09:43:42Z;46,569939;13,904100;559,000000
2017-01-01T09:44:15Z;46,570789;13,902590;560,000000
2017-01-01T09:45:48Z;46,571072;13,902390;562,000000
2017-01-01T09:46:21Z;46,571442;13,902000;566,000000
2017-01-01T09:47:54Z;46,571072;13,902390;562,000000
2017-01-01T09:48:27Z;46,570789;13,902590;560,000000
2017-01-01T09:49:00Z;46,570789;13,902470;560,000000
2017-01-01T09:50:33Z;46,571510;13,901700;568,000000
2017-01-01T09:51:06Z;46,572231;13,901220;575,000000
2017-01-01T09:52:39Z;46,573738;13,900700;582,000000
2017-01-01T09:53:12Z;46,574261;13,900910;585,000000
2017-01-01T09:54:45Z;46,574539;13,900920;587,000000
2017-01-01T09:55:18Z;46,574959;13,900580;590,000000
2017-01-01T09:56:51Z;46,575291;13,900480;593,000000
2017-01-01T09:57:24Z;46,575611;13,900560;596,000000
2017-01-01T09:58:57Z;46,576900;13,901200;593,000000
2017-01-01T09:59:30Z;46,577309;13,901480;592,000000
2017-01-01T10:00:03Z;46,577560;13,901780;592,000000
2017-01-01T10:01:36Z;46,577888;13,902390;591,000000
2017-01-01T10:02:09Z;46,578159;13,903600;587,000000
2017-01-01T10:03:42Z;46,578590;13,904590;581,000000
2017-01-01T10:04:15Z;46,578579;13,904700;581,000000
2017-01-01T10:05:48Z;46,578590;13,904590;581,000000
2017-01-01T10:06:21Z;46,578892;13,905010;580,000000
2017-01-01T10:07:54Z;46,579639;13,905780;577,000000
2017-01-01T10:08:27Z;46,580151;13,905050;575,000000
2017-01-01T10:09:00Z;46,580280;13,903830;571,000000
2017-01-01T10:10:33Z;46,580742;13,902810;565,000000
2017-01-01T10:11:06Z;46,580952;13,902580;564,000000
2017-01-01T10:12:39Z;46,581478;13,902410;561,000000
2017-01-01T10:13:12Z;46,581692;13,902410;560,000000
2017-01-01T10:14:45Z;46,582111;13,902970;559,000000
2017-01-01T10:15:18Z;46,582809;13,903730;558,000000
2017-01-01T10:16:51Z;46,583530;13,904710;560,000000
2017-01-01T10:17:24Z;46,583900;13,905480;563,000000
2017-01-01T10:18:57Z;46,584190;13,906290;562,000000
2017-01-01T10:19:30Z;46,584480;13,908440;560,000000
2017-01-01T10:20:03Z;46,584541;13,909350;560,000000
2017-01-01T10:21:36Z;46,584431;13,911210;563,000000
2017-01-01T10:22:09Z;46,584530;13,912650;568,000000
2017-01-01T10:23:42Z;46,584881;13,913650;574,000000
2017-01-01T10:24:15Z;46,585331;13,914230;580,000000
2017-01-01T10:25:48Z;46,585571;13,914410;584,000000
2017-01-01T10:26:21Z;46,585468;13,914450;580,000000
2017-01-01T10:27:54Z;46,585091;13,915110;572,000000
2017-01-01T10:28:27Z;46,584251;13,915640;564,000000
2017-01-01T10:29:00Z;46,584019;13,915700;562,000000
2017-01-01T10:30:33Z;46,583981;13,916910;566,000000
2017-01-01T10:31:06Z;46,584019;13,918130;563,000000
2017-01-01T10:32:39Z;46,584370;13,919150;562,000000
2017-01-01T10:33:12Z;46,584949;13,920140;561,000000
2017-01-01T10:34:45Z;46,585072;13,920460;559,000000
2017-01-01T10:35:18Z;46,586079;13,922010;556,000000
2017-01-01T10:36:51Z;46,586231;13,922340;555,000000
2017-01-01T10:37:51Z;46,586418;13,923359;555,000000
2017-01-01T10:38:51Z;46,587618;13,922659;555,000000
```

beispiel.gpx:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="" xmlns="http://www.topografix.com/GPX/1/1">
	<metadata>
		<time>2017-01-01T08:05:00.00Z</time>
		<bounds minlat="46.0" minlon="13.0" maxlat="46.1" maxlon="13.1"/>
	</metadata>
	<trk>
		<name>Benennung des Tracks</name>
		<trkseg>
			<trkpt lat="47.81" lon="13.03">
				<ele>500.000000</ele>
				<time>2017-01-01T08:00:00Z</time>
			</trkpt>
			<trkpt lat="47.83" lon="13.05">
				<ele>600.000000</ele>
				<time>2017-01-01T08:01:00Z</time>
			</trkpt>
			<trkpt lat="47.83" lon="13.03">
				<ele>600.000000</ele>
				<time>2017-01-01T08:02:00Z</time>
			</trkpt>
			<trkpt lat="47.81" lon="13.03">
				<ele>500.000000</ele>
				<time>2017-01-01T08:03:00Z</time>
			</trkpt>
		</trkseg>
	</trk>
</gpx>
```

Dieser Track beinhaltet 4 Punkte (trkpt). Für jeden Punkt ist die Zeit (time), Latitude (lat), Longitude (lon) und die Höhe (ele) angegeben.

index.html:

```html
<html>
<head>
	<!-- Source: http://wiki.openstreetmap.org/wiki/Openlayers_Track_example -->
	<title>GPX-Track von ?</title>
	<!--  OpenLayers javascript library
	 	 Wir binden die  Bibliothek direkt aus dem Internet ein, 
	 	 die Datei kann bei Bedarf aber auch lokal abgespeichert werden)
	 -->
	<script src="http://www.openlayers.org/api/OpenLayers.js"></script>
	<!-- OpenStreetMap OpenLayers layers.
		Diese Datei bevorzugt aus dem Internet laden um sie aktuell zu halten 
	 -->
	<script src="http://www.openstreetmap.org/openlayers/OpenStreetMap.js"></script>

	<script type="text/javascript">
		// Aendern auf Trail-Start:
		var lat=47.8218747
		var lon=13.0454751
		var zoom=13

		var map; //complex object of type OpenLayers.Map

		function init() {
			map = new OpenLayers.Map ("map", {
				controls:[
					new OpenLayers.Control.Navigation(),
					new OpenLayers.Control.PanZoomBar(),
					new OpenLayers.Control.LayerSwitcher(),
					new OpenLayers.Control.Attribution()],
				maxExtent: new OpenLayers.Bounds(-20037508.34,-20037508.34,20037508.34,20037508.34),
				maxResolution: 156543.0399,
				numZoomLevels: 19,
				units: 'm',
				projection: new OpenLayers.Projection("EPSG:900913"),
				displayProjection: new OpenLayers.Projection("EPSG:4326")
			} );

			// Define the map layer
			// Here we use a predefined layer that will be kept up to
            // date with URL changes
			layerMapnik = new OpenLayers.Layer.OSM.Mapnik("Mapnik");
			map.addLayer(layerMapnik);
			layerCycleMap = new OpenLayers.Layer.OSM.CycleMap("CycleMap");
			map.addLayer(layerCycleMap);
			layerMarkers = new OpenLayers.Layer.Markers("Marker");
			map.addLayer(layerMarkers);

			// ******************************************************************
			// Block "Layer mit GPX-Track" - Start
			var GPXVariable_1 = new OpenLayers.Layer.Vector("Beispielstrecke", {
				strategies: [new OpenLayers.Strategy.Fixed()],
				protocol: new OpenLayers.Protocol.HTTP({
					url: "./beispiel.gpx",
					format: new OpenLayers.Format.GPX()
				}),
				style: {strokeColor: "red", strokeWidth: 5, strokeOpacity: 0.5},
				projection: new OpenLayers.Projection("EPSG:4326")
			});
			map.addLayer(GPXVariable_1);
			// Block "Layer mit GPX-Track" - Ende
			// ******************************************************************

			var lonLat = new OpenLayers.LonLat(lon, lat).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject());
			map.setCenter(lonLat, zoom);
			
			// Home-Marker A214
			var latH=47.8218747
			var lonH=13.0454751

			var lonLatH = new OpenLayers.LonLat(lonH, latH).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject());

			var size = new OpenLayers.Size(90, 40);
			var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
			var icon = new OpenLayers.Icon('./marker.png',size,offset);
			layerMarkers.addMarker(new OpenLayers.Marker(lonLatH,icon));
		}
	</script>

</head>
<!-- body.onload is called once the page is loaded
	 (call the 'init' function) -->
<body onload="init();">
	<!-- define a DIV into which the map will appear. Make it
		 take up the whole window -->
	<div style="width:90%; height:90%" id="map"></div>
</body>
</html>
```

In dieser Datei muss der GPX-Track angegeben (...url: "./beispiel.gpx"). Es können auch mehrere Tracks eingefügt werden, dann muss ein weiterer Layer (map.addLayer) einkopiert werden.

## Funktionen, Felder

### Verschiedene (071)

a) Programmieren Sie die folgenden Funktionen.
b) Programmieren Sie ein Testprogramm für die folgenden Funktionen.

```c
int pow(int x, int n);
int fakt(int n);

int checkDoppelte(int a[], int len);
int getMaxIndex(int a[], int len);

void sort(int a[], int len);

void delCharAt(char text[], int stelle);
void insertCharAt(char text[], char ch, int stelle);

void mystrcpy(char ziel[], char quelle[]);
void removeVowel(char s[]);

int getZiffernSumme(int zahl);
void hex2int(char hexziffern[]);
```

### Stack (091)

gegeben stack.h

```c
void init(void);
	// löscht d. Stack,d.h. stackpointer auf 0 setzen	
void push(double value)      ;
	// legt value auf den Stack,
	// wenn dieser aber bereits voll ist, wird auf 
	// stderr Stack voll geschrieben und 
	// der Wert nicht auf den Stack gelegt.
double  pop(void);
	// gibt den obersten Wert des Stack zurück,
	// wenn dieser aber bereits leer ist, 
	// wird auf stderr
	// Stack leer geschrieben.
```

gesucht stack.c
```c
#include "doubleStack.h"
#define STACK_MAX 1024
	
// niemand anderer darf auf diese globale Variable zugreifen.
??????????? double dblStack[STACK_MAX];	
??????????? int p_stack;	// Der Stackpointer

?????????
```

gesucht Testprogramm: main.c
```c
???????????
```

##Zeiger, Speicher Allozieren (092)

Bringen Sie folgendes Programm strdup.c zum Laufen.

```c
#include <stdio.h>
?????????????????
char* mystrdup(const char* );

int main(){
	char str[128];
	char* p;	
	printf("\nstrdup-test: Bitte einen Text: ");
	gets(str);
	p= mystrdup(str);
	printf("\nmystrdup() lieferte: <%s>\n", p);
	?????????????????????(p);
	return 0;
}

/*1. Schauen Sie, wie lange der string in s ist? tipp: int strlen(const char*);
2. Holen Sie Speicher vom Betriebssystem: tipp: void* malloc(int);
3. string s in den neuen Speicher kopieren tipp: 
   char* strcpy(char* ziel, const char* quelle);
4. Geben Sie neuen speicher mit return zurueck*/

char* mystrdup(const char* s){
	??????????????????????
}
```

## Strukturen, Zeiger

### Datum (093)

Gegeben sei:

```c
struct datum{
	int tag, monat, jahr;
	char mon_name[4];
};
typedef struct datum TDATUM;

// Funktions-Deklaration
TDATUM getDatum(int tag, int monat, int jahr);

// Funktions-Aufruf
TDATUM heute;
heute= getDatum(20,2,2012);
```

Gesucht: Funktion getDatum ausprogrammiert
```c
??????????? getDatum(?????????????????){
	?????????????
}	
```

Gesucht: Schreiben Sie getDatum() so um, dass die Rückgabe nicht mittels return, sondern mittels call-by-reference zurückgegeben wird.
```c
// Funktions-Deklaration
void getDatum2(int tag, int monat, int jahr, ?????????????);

// Funktions-Aufruf
?????????

// Funktion ausprogrammiert
?????????
```

### Mit Strukturen Sortieren (094)

Vervollständigen Sie den folgenden Code:

```c
typedef struct person {
	int persnr;
	char name[40];
} TPERSON;
#define ANZ  3

void sort_persnr(TPERSON *p, int anzahl);

int main(int argc, char *argv[]){
	TPERSON wir[ANZ];
	int i;

	printf("\nBitte %d Datensaetze eingeben:\n", ANZ);
	for (i=0; i < ANZ; i++){
		printf("\n%d:persnr> ", i);

		scanf("%d", ___________________________);
		printf("%d:Name> ", i);

		scanf("%s", _________________________________);
	}

	// Das Array mit dem Namen wir soll sortiert werden

	sort_persnr(________________________, ___________________);

	printf("\nAusgabe: Sortiert wurde nach persnr:\n");
	for (i=0; i < ANZ; i++){

		printf("\n%6d | %-20s", _________________ , ________________);
	}
	return 0;
}

void sort_persnr(TPERSON* p, int anzahl){
	int i;
	int fertig;

	fertig=0;
	while (0==fertig){
		fertig= 1;

		for (i=0; i < ___________________; i++){

			if ( (p _________)->persnr > (p _____________)->persnr){

					___________________ help;

				help= _________________;

				_________________ = _________________;

				_________________ = help;

				fertig= _________________;
			}//if
		}//for
	}//while
}
```

##Strukturen, Felder und Dateien

###Body Mass Index (038)
Das Programm soll:
+ eine geeignete Datenstruktur definieren
+ die Datei *input.txt* in ein Array laden
+ die fehlenden Werte berechnen
+ die Datei *output.txt* beschreiben

Beispiel: input.txt
​	3
​	4cheli,anton,hofmann,70,170
​	4cheli,beta,hofmann,80,180
​	4cheli,gamma,hofmann,90,190

Inhalt der Datei output.txt:
klasse, maxgewicht, mingewicht, maxgroesse, mingroesse, maxbmi, minbmi, durchschnittsgewicht, durchschnittsgroesse, durchschnittsbmi

Erweiterung:

### Room-Temp (039)

Inhalt der Datei *room-temp.txt*:

```
3
Schlafzimmer:20
Kueche:25
Keller:15
```

Erstellen Sie ein Programm:

- Definieren Sie einen geeigneten Datenstruktur-Typen zur Verarbeitung der obigen Daten.
- Lesen Sie die Daten aus der Datei in ein Feld ein das durch *malloc()* alloziiert wurde.
- Für sämtliche Räume mit einer Temperatur über 19°C wird der Text "Fenster Oeffnen: ", der Raumname und die aktuelle Raumtemperatur (samt Einheit) auf der Konsole ausgegeben.
- Schreiben Sie die Funktion *printDurchschnitt()*, die von allen Räumen die Durchschnittstemperatur berechnet und diese auf die Konsole ausgibt.

Ausgabe für die obige Datei:

```
Fenster Oeffnen: Schlafzimmer: 20 degC
Fenster Oeffnen: Kueche: 25 degC
Durchschnittstemperatur: 20 degC
```

### Traffic (095)

* Definieren Sie einen geeignete Datenstruktur-Typ zur Verarbeitung der Daten aus der Datei *input.txt*.
* Lesen Sie die Daten in ein mit *malloc()* zu alloziierendes Feld.

Inhalte der Datei *input.txt*:

```
3
Maserati,1000 kg,2 Persons
VW,800 kg,4 Persons
Bus,2500 kg,8 Persons
```

Ausgabe:

```
With 3 vehicles we transport 14 persons using 4300 kg.
So for 1 person we have to move about 307.14 kg 'vehicle weight'.
```

## Fragen

Erklärung für:

- static global
- cast operator
- call-by-reference

Bewerten Sie die folgenden Fragen mit Wahr oder Falsch (inkl. Begründung):

- char* p1; double* p2;  sizeof(p2) > sizeof(p1)   ....liefert true
- int wert; scanf("%i", &wert);
- Das letzte Zeichen löschen: str[strlen(str)]= '/0';
- int x=5, y=2; float erg; erg= x/y;  printf("%.1f", erg); ... gibt 2.5 aus

Definieren Sie ein Feld mit Namen a mit 10 Zeigern auf char als Elemente.
