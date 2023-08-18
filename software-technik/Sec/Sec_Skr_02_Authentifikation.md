# 2 Authentifikation

Für Kommunikation, beispielsweise über Internet (Mail ...), ist es erforderlich sicherstellen zu können wer der Kommunikationspartner ist.

Beispiele: Kaufverträge, E-Banking, Verträge, Behördeneingaben, persönliche Datenübertragung, Web-Seiten

Problem: Es wird eine Nachricht erhalten, wie kann sich der Empfänger sicher sein, dass der Absender derjenige ist der er vorgibt zu sein?

- Die Nachricht könnte von einem beliebigen Absender sein, der nur vorgibt jemand anderer zu sein.
- Die Rahmen der Nachricht könnten vom erklärten Absender sein, der Inhalt könnte von jemanden dazwischen verändert worden sein.

Eine Lösung bietet die Public-Key-Kryptographie. Sie wird als **digitale Signatur** oder **elektronische Unterschrift** bezeichnet. Mittels digitaler Signatur kann sich Alice eindeutig authentifizieren: Bob sendet eine Zufallszahl, Alice signiert diese und sendet die signierte Zahl zurück. Damit kann Bob sicher sein mit Alice zu kommunizieren.

Für die Authentifikation kommen häufig Peggy (Prover - der zu Überprüfende) und Victor (Verifier - der Prüfende) zum Einsatz.

## Public-Key-Signatur

Mittels Public-Key-Verschlüsselung kann ein Absender mit seinem geheimen Schlüssel eine Nachricht verschlüsseln. Entschlüsseln kann die Nachricht jeder nur mittels öffentlichen Schlüssel des Absenders. Jede Nachricht, die sich mittels dieses öffentlichen Schlüssels entschlüsseln lässt wurde damit eindeutig von jemanden mit dem dazugehörigen geheimen Schlüssel verschlüsselt. Sofern der geheime/private Schlüssel nur dem Absender bekannt ist, funktioniert das zuverlässig.

Problem: dem nicht verschlüsselten Dokument wird als Signatur das verschlüsselte Dokument beigelegt. Allerdings ist die digitale Signatur so groß, wie das ursprünglich zu signierende Dokument.

Lösung: Das Dokument wird mittels einer **Einwegfunktionen/Hashfunktionen** verkürzt. Dieser Hashwert wird dann mittels Private-Key verschlüsselt. Die so ermittelte Signatur wird dem Dokument beigefügt. Der Empfänger berechnet ebenfalls den Hashwert über das erhaltene Dokument. Dieser Wert muss mit dem mit gesendeten Wert übereinstimmen. Jede Veränderung des Dokuments wird erkannt.

## Einwegfunktionen/Hashfunktionen

Mittels einer Einwegfunktion wird aus dem zu signierenden Dokument ein entsprechender **kryptographischer Fingerabdruck** oder **Hash-Wert** erzeugt. 

Für diesen Hash-Wert muss gelten:

- einfach zu berechnen
- eindeutig einem Dokument zuordenbar
- schon kleine Änderungen im Dokument muss den Hash-Wert verändern
- Die Berechnung eines Dokuments aus dem Hash-Wert soll nur mit nicht vertretbaren Aufwand möglich sein (Einweg)
- Es muss sehr schwierig sein, zwei Dokumente mit dem gleichen Hash-Wert zu finden

Allgemeines Beispiel für eine Einwegfunktion:

```
(x-1)(x-2)(x-3)(x-4)(x-5)(x-6)
```

Das Ausmultiplizieren dieses Terms ist trivial möglich. Umgekehrt, um von der Lösung auf diesen Term zurück zu schließen ist kein Verfahren existent (für Polynome mit Grad größer 5 ist das bewiesen!).

Häufig werden diese Hash-Werte rekursiv berechnet, zum Beispiel:

- Klartext-Dokument *M* wird in *m*-lange Teile zerlegt, M = (M1, M2 ... Mk)
- Der Hash-Wert *h* hat eine Länge *n* (<*m*)
- h0 = 0                             (Startwert)
- hi = f(   Mi, h(i-1)   )       (Berechnung aus iten Klartextanteil und vorhergehender Hash-Stelle)

- h = hk                             (letzte Iteration liefert den Hash-Wert)

Wichtige Einweg-Hash-Funktionen:

- **MD4** (**M**essage **D**igest) - 128 Bit langer Hash-Wert von Ron Rivest
- **MD5** - sicherere Weiterentwicklung von MD4, 128 Bit langer Hash-Wert, wird in PGP verwendet. Es sind Kollisionen bekannt, daher Empfehlung: nicht für langfristige und zustandslose Hashes verwenden.
- **SHA** (**S**ecure **H**ash **A**lgorithm) - von amerikanischen Behörden aus MD4 entwickelt. Weiterentwicklung SHA-1 mit 224 Bit. Wiederum weiterentwickelt zu SHA-2, momentan der am weitesten verbreitete Hash mit 256, 384 oder 512 Bit.
- **RIPE-MD** - 160 Bit Weiterentwicklung von MD4, im Rahmen des EU-Projekts RIPE entwickelt. Gilt als sehr sicher (gibts auch in anderen Bit-Versionen)

> Eine Einweg-Hash-Funktion bildet einen Klartext auf einen stark verkürzten Hash-Wert ab, der wie ein Fingerabdruck für dieses Dokument verstanden werden kann.

## Passwortverschlüsselung

Wie soll sich ein Mehrbenutzer-Betriebssystem die Passwörter der anmeldeberechtigten Benutzer merken? Wenn sie direkt im Dateisystem abgelegt werden, kann ein Benutzer diese Datei lesen und auswerten. Eine praktische Lösung bieten die oben beschriebenen Einwegfunktionen:

- Ein von einem Benutzer eingegebenes Passwort wird mittels Einwegfunktion verschlüsselt
- Selbst wenn dieses verschlüsselte Passwort bekannt ist, kann die verschlüsselte Form nicht verwendet werden, es wird ja nach der Klartextform gefragt
- Wichtig daher: aus dem verschlüsselten Wert darf nicht auf den unverschlüsselten Rückrechenbar sein (Einwegfunktion)

Lösung zum Brechen dieser Verschlüsselung: Anlegen einer Tabelle (Rainbow-Tabelle). In dieser Tabelle werden Klartexte von möglichst vielen gängigen Passwörtern und daraus resultierende Einwegwerte abgelegt. Damit kann häufig schon ein Erfolg erzielt werden.

Aus diesem Grund wird vor der Berechnung der Einwegfunktion das Passwort vom System mit einem Standardzusatztext erweitert (**Salt**). Etwa könnte jeder Rechner ein eigenes Salt verwenden, dann ist das brechen der Verschlüsselung schon aufwändiger, wenn Salt eine Länge von 12-Bit hat, dann müssen für jedes Passwort aus der ursprünglichen Tabelle 4096 Werte abgelegt werden.

> Um sich Passwörter zu merken empfehlen sich Einwegfunktionen. Um die Sicherheit zu steigern können für die Berechnung Zusatzzeichen eingefügt werden.

## Zero-Knowledge-Protokolle

Die obige Passwortverschlüsselung kann durchaus sicher gestaltet werden. Problematisch ist eine Passworteingabe allerdings immer noch wenn zwischen berechnetem Hash und Übertragen für den Vergleich mit gespeichertem Hash eingegriffen werden kann. Das ist der Fall wenn auf einen entfernten Rechner (Internet) angemeldet werden soll. Dabei kann der kopierte Hash ja einfach direkt übertragen werden (Replay). Für diesen Fall gibt es eigene Protokolle.

### Challenge-and-Response

Bob sendet Alice eine Zufallszahl und fordert sie auf diese zusammen mit dem Passwort mittels der Einweg-Hash-Funktion zu verschlüsseln und das Ergebnis zu senden. Die Berechnung führt auch Bob durch und kann das erhaltene Ergebnis mit dem Eigenen vergleichen. Damit kann mittels Replay nicht eingegriffen werden, es müssten die Hash-Werte für sämtliche Zufallszahlen bekannt sein.

### Echtes Zero-Knowledge

Die beste Variante ist auf alle Fälle:

- es wird nichts übertragen was sicherheitsrelevante Information beinhaltet, also Passwort aber auch Hash-Wert (beinhaltet ja Information über das Passwort)
- beim Empfänger ist das Passwort oder der Hash-Wert auch nicht bekannt und kann damit nicht verraten oder verloren werden

Damit muss beim Empfänger gar nichts (Zero) bekannt sein.

Als sehr anschauliches, historisches Beispiel kann hier das Lösen von kubischer Gleichungen angeführt werden:

- Noccolò Tartaglia endeckt 1535 die Formel zur Lösung von kubischen Gleichungen
- Seine Fachkollegen durften ihm kubische Gleichungen nennen, er löste diese und gab ihnen die Lösung bekannt
- Nachdem Tartaglia für alle genannten Gleichungen eine Lösung präsentieren konnte, war offensichtlich dass er einen Lösungsweg kennt, wie diese Lösung lautet war damit nicht erkennbar

In der Kryptologie kann dieses Vorgehen mittels Public-Key erreicht werden. Victor sendet Zufalls-Klartext, Peggy verschlüsselt mit seinem geheimen Schlüssel und Victor kann mittels Public-Key die Echtheit prüfen.

Das **Fiat-Shamir-Protokoll** ist kein echtes Zero-Knowledge-Protokoll:

1. Peggy besitzt einen geheimen Schlüssel (Passwort)

2. Peggy wählt einen Modul $m = p\cdot q$ (p, q sind Primzahlen) und gibt diesen öffentlich bekannt (dieser Modul wird von einer vertrauenswürdigen dritten Partei bekannt gegeben)

3. Peggy berechnet $v = s^2\ mod\ m$ und gibt es öffentlich bekannt. (m, v) ist der öffentliche Schlüssel

4. Peggy wählt eine zufällig Zahl $r$

5. Peggy berechnet $x = r^2\ mod\ m$ und sendet $x$

6. Viktor entscheidet sich für $b = 1$ oder $b = 0$ (Challenge) und sendet $b$

7. Wenn $b = 0$ sendet Peggy $y = r\ mod \ n$
   Viktor prüft: $y^2\ mod \ n = x$

8. Wenn $b = 1$ sendet Peggy $y = (r\cdot s)\ mod \ n$ (NICHT Zero-Knowledge)
   Viktor prüft: $y^2\ mod\ n = x\cdot v\ mod \ n$

Die Punkte 4-8 können von Viktor beliebig oft wiederholt werden. Wenn Peggy tatsächlich im Besitz des Schlüssels s ist, dann wird das Ergebnis immer richtig sein.

Erweitert wurde das Protokoll als **Feige-Fiat-Shamir-Protokoll**. Dabei wird das Protokoll so erweitert, dass es ein echtes Zero-Knowledge-Protokoll ist und durch die dargestellt einfache Berechnung sehr gut für Chipkarten-Prozessoren (Low-Power) eignet.

## Public-Key-Infrastruktur

Die Verschlüsselung oder Signatur von Dokumenten mittels Public-Key ist eine praktische Sache. Das Problem ist nur, woher kann ein Empfänger wissen ob derjenige der den Public-Key zur Verfügung stellt derjenige ist der er vorgibt zu sein?

Um dafür geeignete Rahmen zu schaffen ist eine gewisse Infrastruktur notwendig - eine **Public-Key-Infrastruktur**.

### X.509

Um einen Kommunikationspartner eindeutig als Denjenigen identifizieren zu können, als der er sich ausgibt, wurden Zertifikate nach dem Standard *X.509* definiert.

Ein solches Zertifikat beinhaltet (knapper Auszug):

- Inhaberdaten (Land, Organisation, Name ...)
- Ausstellerdaten (Land, Organisation ...)
- Gültigkeit (von, bis)
- Zertifikatinhaber-Schlüsselinformationen (Public-Key-Algorithmus, Public Key des Zertifikatinhabers)
- Seriennummer
- Fingerabdrücke (Signaturen etwa SHA-256 ...)
- Daten die Zertifizierungsstelle betreffend
- Signatur - Signatur des Hash-Werte aller anderen Felder durch den Aussteller des Zertifikats

Ein Kommunikationspartner kann demnach ein Zertifikat vorweisen, dass von einer vertrauenswürdigen Stelle ausgestellt wurde. Browser haben aus diesem Grund eine Liste von vertrauenswürdigen Zertifizierungsstellen (fest!) eingebaut. Die im Zertifikat eingebaute Signatur kann mittels Public-Key der CA (Zertifizierungs-Institution) auf Gültigkeit geprüft werden.

Eine Möglichkeit um Zertifikate zu erstellen ist, dass eine CA ein gültiges Zertifikat einer übergeordneten CA besitzt, das bedeutet eine CA kann weitere CAs zertifizieren -> **hierarchische Public-Key-Infrastruktur**.

![](bilder/Kry_Pki.png)

Eine andere Variante wird durch die Open-Source Software GPG-PGP (Gnu Privacy Guard-Pretty-Good-Privacy) verwendet. Dabei kann jeder Benutzer Zertifikate für andere Benutzer ausstellen. Wenn immer jemand in der Kette vertrauenswürdig ist, dann kann davon ausgegangen werden, dass ein erhaltenes Zertifikat vertrauenswürdig ist. Diese Art wird als **Web-of-Trust** bezeichnet.

## Fragen

- Was ist eine PKI und für was ist sie notwendig?
- Was beinhalten X.509 Zertifikate und wofür werden sie verwendet?
- Was bedeutet *Zero-Knowledge*?
- Welche Eigenschaften muss eine Hash-Funktion erfüllen?
- Wie wirkt sich Signieren auf die Aspekte *Vertraulichkeit* und *Verbindlichkeit* aus?
- Was bedeutet *Einweg*-Funktion?