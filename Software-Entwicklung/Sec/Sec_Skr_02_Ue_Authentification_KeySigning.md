# KEY-Signing-Party: HOWTO

Organisieren einer **KEY-Signing-Party** um

1. eigenen **Public** und **Private Key** zu erzeugen
2. eigenen **Public** key auf einen Key-Server uploaden
3. **Public** Keys von Kollegen **unterschreiben** (**Web-Of-Trust**)
4. Mails **Verschlüsseln** und **Unterschreiben**


## 1. Aufgabe des Party-Koordinators

1. Die Schlüssel-Liste generieren und
2. eine Kopie der Schlüssel-Liste für jeden der Party-Teilnehmer ausdrucken

| Schlüssel-ID | Schlüssel-Besitzer | Schlüssel-Fingerprint | Schlüssel-Größe  | Schlüssel-Typ  | Schlüssel-Infos passen? | Besitzer-Identifikation (Ausweis) passt? |
|--|--|--|--|--|--|--|
| 12345678	| "Max Mustermann <max.mustermann@server.dmn>" | 820C 8783 2F4C 8659 56F4  F3BF 56AF 8035 1234 5678 | 4096 | RSA |  ||
|...|...|...|...|...|...|...|


## 2. Aufgabe der Teilnehmer

1. Ein Schlüssel-Paar erstellen
2. Den öffentlichen Schlüssel an den gewählten Keyserver <http://pgp.mit.edu/> senden
3. Die Informationen zum öffentlichen Schlüssel an den Party-Koordinator schicken
4. Zur Party kommen
5. Ihre eigenen Schlüssel-Informationen bestätigen
6. Die Schlüssel-Informationen der anderen prüfen. Prüfen Sie von jedem die Identität für die Schlüssel-IDs, die Sie signieren wollen
7. Alle geprüften Schlüssel auf den eigenen PC laden und signieren
8. Die signierten Schlüssel an den gewählten Key-Server  <http://pgp.mit.edu/> senden

## 3. Was man zur Party mitbringen soll

1. Einen amtlichen Lichtbildausweis
2. Eine geprüfte (über den eigenen Schlüsseleintrag) Kopie der Schlüssel-Liste
3. Einen Stift, um die anderen Schlüssel auf der Schlüssel-Liste zu prüfen.

## 4. Party-Teilnehmer Vorbereitungen (mit gpg)

(GPG: GNU Privacy Guard und Tools)

* Linux: `sudo apt-get install gpg` 

  Windows: Installation von GPG :  www.gpg4win.de

  Installation von Thunderbird : www.mozilla.org/de/thunderbird/

* Info: <https://www.gnupg.org/howtos/de/index.html>

### 4.1. Schlüsselpaar erstellen
Erstellen Schlüsselpaar `gpg --gen-key`:

~~~
$> gpg --gen-key

a) Wählen Sie den Schlüsseltyp, den Sie wünschen - die Voreinstellung passt.
	Bitte wählen Sie, welche Art von Schlüssel Sie möchten:
	(1) DSA und ElGamal (voreingestellt)
	(2) DSA (nur signieren/beglaubigen)
	(5) RSA (nur signieren/beglaubigen)
	Ihre Auswahl? <return>

b) Wählen Sie ihre Schlüsselgröße: 2048
	Das DSA-Schlüsselpaar wird 1024 Bit haben.
	Es wird ein neues ELG-E Schlüsselpaar erzeugt.
	kleinste Schlüssellänge ist 768 Bit
	standard Schlüssellänge ist 1024 Bit
	größte sinnvolle Schlüssellänge ist 2048 Bit
	Welche Schlüssellänge wünschen Sie? (1024) 
	2048<return>

c) Wählen Sie die Lebensdauer des Schlüssels: 5 Jahre ist brauchbar.
	Die verlangte Schlüssellänge beträgt 2048 Bit
	Bitte wählen Sie, wie lange der Schlüssel gültig bleiben soll.
	0 = Schlüssel verfällt nie
	<n> = Schlüssel verfällt nach n Tagen
	<n>w = Schlüssel verfällt nach n Wochen
	<n>m = Schlüssel verfällt nach n Monaten
	<n>y = Schlüssel verfällt nach n Jahren
	Wie lange bleibt der Schlüssel gültig? (0) 5y<return>
	Key verfällt am Mon 31 Mär 2008 08:18:12 CEST
	Ist dies richtig? (j/n) 
	j<return>

d) Geben Sie ihren Namen und die E-Mail Adresse(n) ein...
	Ihr Name ("Vorname Nachname"): Max Mustermann<return>
	E-Mail-Adresse: max.mustermann@server.dmn<return>
	Kommentar:
	Sie haben diese User-ID gewählt:
	"Max Mustermann <max.mustermann@server.dmn>"

	Ändern: (N)ame, (K)ommentar, (E)-Mail oder (F)ertig/(B)eenden? 
	F<return>

e) Wählen Sie ein Mantra. 
	Es sollte lang und sehr schwer zu erraten sein. 
	Es sollte etwas sein, das Sie nicht vergessen werden. 
	Falls Sie ihr Mantra vergessen können Sie ihren Schlüssel nicht wiederherstellen.

f) Bewegen Sie die Maus, drücken einige Tasten. 
	GPG liest von /dev/random, um etwas Zufälligkeit für ihre Schlüsselgenerierung zu erhalten.

~~~

Kontrolle: `gpg --list-secret-keys`:

~~~
/home/mustermann/.gnupg/pubring.kbx
--------------------------------
pub   rsa4096 2016-08-22 [SCA] [verfällt: 2021-08-21]
      820C87832F4C865956F4F3BF56AF803512345678
uid        [ unbekannt ] Mustermann <max.mustermann@server.dmn>
...
~~~

Key-ID:  die letzten 8 Zeichen, hier: 12345678

### 4.2. Public-Key an den Keyserver senden

Public-Key veröffentlichen `gpg --keyserver pgp.mit.edu --send-key 12345678`:

~~~
Sie sollten eine Erfolgsmeldung wie diese sehen:
gpg: Senden an `pgp.mit.edu' erfolgreich (status=200)
~~~
Alternativ: Web-Interface von <http://pgp.mit.edu/>

Falls Sie ihren Schlüssel nicht auf einem öffentlichen Keyserver haben wollen, sollten Sie ihn stattdessen direkt an ihre Partner schicken.
Sehen Sie dazu hier <https://www.gnupg.org/gph/de/manual/x193.html>

### 4.3. Ein Widerruf-Zertifikat erstellen

Erstellen des Zertifikats: `gpg --output revcert.asc --gen-revoke 12345678`

### 4.4. Informationen an den Party-Koordinator schicken
Schicken Sie ihre Informationen per E-Mail an den Koordinator und erzählen Sie ihm, dass Sie zur Key-Signing-Party erscheinen werden. Der unten angeführte Befehl wird die Informationen anzeigen, die Sie an den Koordinator schicken sollten, falls Sie einen Key-Server benutzen. Sie können dann diese Informationen in einer verschlüsselten E-Mail-Nachricht an den Koordinator schicken.

`gpg --fingerprint 12345678`


### 4.5. Beachte: KEIN fremder Zugriff auf .gnupg Ordner
~~~
$ cd
$> ls -la | grep gnu
drwx------  4 mustermann mustermann     4096 Jän 25 22:09 .gnupg
~~~

## 5. Erscheinen Sie auf der Party
1. Kontrollieren Sie Ihren eigenen Fingerprint auf der Schlüssel-Liste
2. Kontrollieren Sie die Identität der anderen Personen und deren Schlüssel.

## 6.  Andere Schlüssel signieren
### 6.1. Besorgen Sie sich eine Kopie des Schlüssels
Üblicherweise werden Sie über einen Keyserver arbeiten. Falls Sie jedoch einen Schlüssel signieren, der nicht auf einem Keyserver verfügbar ist, können Sie den Schlüssel einfach mit gpg --import importieren. Falls Sie mit einem Keyserver arbeiten, wird der folgende Befehl den Schlüssel vom Keyserver in ihren öffentlichen Keyring herunterladen.

`gpg --keyserver pgp.mit.edu --recv-keys 12345678`

Falls Sie einen Lese-Fehler erhalten, bedeutet es, dass der Keyserver überlastet ist. Versuchen Sie es bitte in ein paar Sekunden erneut.

### 6.2. Fingerprint und Prüfung des Schlüssels

`gpg --fingerprint 12345678`

GPG wird den Fingerprint des Schlüssels mit <Key_ID > ausgeben (der Schlüssel, den Sie gerade heruntergeladen haben). Vergleichen Sie den Fingerprint mit der Prüfliste, die Sie auf der Party erhalten haben. 

### 6.3. Signieren Sie den Schlüssel

`gpg --sign-key 12345678`


### 6.4. Schicken Sie den signierten Schlüssel retour oder laden Sie ihn hoch
`gpg --keyserver pgp.mit.edu --send-key 12345678`

Gratulation, die Signatur auf dem Schlüssel der anderen Person ist nun beendet und ihre Signatur wurde in deren öffentlichen Schlüssel eingearbeitet. **Ein Vertrauenspfad wurde erstellt**.

## 7. Ihr Schlüsselpaar widerrufen
Falls Sie vermuten, dass ihr geheimer Schlüssel kompromittiert wurde, sollten Sie ihren öffentlichen Schlüssel unverzüglich widerrufen. Das Widerrufen eines Schlüssels funktioniert **durch das Hinzufügen einer Widerruf-Signatur auf dem öffentlichen Schlüssel**. Das Widerrufen eines Schlüssels schlägt vor, dass ein Schlüssel nicht mehr gültig (sicher) ist und nicht verwendet werden sollte. Wenn ein Widerruf-Zertifikat angewendet wird, kann es nicht mehr zurückgenommen werden.

Als Wiederholung hier der Befehl, um ein Widerruf-Zertifikat zu erstellen:

`gpg --output revcert.asc --gen-revoke 12345678`


## 8. Teilnehmer Vorbereitungen (mit Thunderbird und Enigmail):
1. Installation Thunderbird www.mozilla.org/de/thunderbird/

2. Intstallation *Enigmail*-Add-one in Thunderbird

3. Thunderbird->Einstellungen->Enigmail->Schlüssel Verwalten->Erzeugen

4. Zum Üben des Arbeitens mit verschlüsselten Mails mit den erstellten Schlüsseln gibt es eine Vielzahl an Mail-Bots (erhalten und antworten automatisch auf Mails). Aktuell (Erstellung des Dokuments) gibt es etwa https://gpgtest.phpgangsta.de/#gpgemailbot. Eine Anleitung ist dort auch zu finden, z.B.:

  - Senden eines Public-Keys an den Bot, man erhält ein verschlüsseltes Reply
  - Senden eines verschlüsselten Mails (mit dem Public-Key von der Seite) und erhalt einer Bestätigung

  (Es kann passieren, dass die Mails von dieser Seite im Spam-Ordner des Mail-Anbieters landen!)

### 8.1. Aufgabe Party-Koordinator:
1. Public-Keys der Teilnehmer empfangen und importieren
2. ALLE Public-Keys exportieren (alle.asc)
3. Key-Party-Liste erzeugen (xls-Datei) und ausdrucken / auf das Klassenlaufwerk stellen

### 8.2. Aufgabe Party-Teilnehmer:
1. Den eigenen Public-Key-Fingerprint mit dem Fingerprint in der Key-Party-Liste überprüfen
2. Wenn alle Fingerprints überprüft wurden dann die Identität der Party-Teilnehmer (Ausweis, ...) prüfen
3. Alle Public-Keys vom Koordinator empfangen und importieren
3. Alle Public-Keys unterschreiben
4. Alle Public-Keys auf den Keyserver senden

## 9. Gute Erklärung  
<http://fenon.de/category/sonstiges/sicherheit/>

## 10. Über dieses Dokument
Copyright (c) 2000 - 2003 V. Alex Brennen.

Hiermit ist die Erlaubnis erteilt, dieses Dokument zu den Bedingungen der GNU Free Documentation License, Version 1.1 oder jeder neueren von der Free Software Foundation veröffentlichten Version zu kopieren, verteilen und/oder zu verändern.

Dieses Dokument ist auf https://rhonda.deb.at/projects/gpg-party/gpg-party.de.html#ss1.1 zu finden.

2018 verändert von Anton Hofmann

Angepasst von Roman Schragl


