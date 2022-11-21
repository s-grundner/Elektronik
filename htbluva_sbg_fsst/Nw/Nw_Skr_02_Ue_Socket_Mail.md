

# EMail (SMTP, POP3, IMAP)

## Allgemeines

Entwickeln eines E-Mail Client. Viele E-Mail Provider bieten keinen Zugang mittels "einfacher" Protokolle an. Vielmehr wird der Zugriff mittels unterschiedlicher Sicherheitsmaßnahmen und Protokollen abgesichert. Grundsätzlich ist das sehr sinnvoll, ansonsten könnte Missbrauch erfolgen (SPAM, Datendiebstahl).

### Test-E-Mail-Konto Anlegen

- Für dieses Beispiel wird am Beste zuerst einmal ein E-Mail-Konto bei Gmail/Google angelegt. Hier wird aus Testzwecken bewusst ein Account angegeben, damit beim Testen ein wenig Traffic verfolgbar ist.

![image-20200428111847710](bilder/Nw_Mail_CrtGoogleAccount.png)

​		Die Zugangsdaten müssen Sie sich auf alle Fälle merken/abspeichern.

- Um mittels eigener Anwendung zugreifen zu können muss eine Einstellung angepasst werden:
  - Google-Konto verwalten
  - Sicherheit -> Zugriff durch weniger sichere Apps = An (diese Einstellung ermöglicht es erst via der Mail-Protokolle auf den Server zugreifen zu können. Für viele Anwender werden die Mails nur via WebApplikation verwaltet, dann wäre das nicht notwendig).

### Direkter Test

Bis vor einigen Jahren waren viele Mail-Provider direkt mittels der Protokolle erreichbar. Da die Protokolle SMTP, POP3 und IMAP auf TCP aufsetzten, konnte so direkt mittels Telnet mit diesen Providern kommuniziert werden. Dadurch sind die übertragenen Daten von Dritten direkt lesbar. Aus diesem Grund wurden die Protokolle dafür zumindest auf SSL/TLS aufgesetzt. Das ist eine Schicht zwischen TCP und den übergeordneten Schichten, die den gesamten Datenverkehr verschlüsselt. Dieser kann zwar ebenfalls mitgehört werden, für aktuell "gängige" Rechnerleistungen aber nur mit unverhältnismäßig hohen Aufwand zu entschlüsseln. Um verschlüsselt kommunizieren zu können ist Telnet nicht geeignet, dafür kann z.B. *OpenSSL* verwendet werden. OpenSSL beinhaltet einerseits Bibliotheken für die Entwicklung von kryptographischen Anwendungen (Zertifikat-, Schlüsselerzeugung, Ver-/Entschlüsseln ...) und andererseits Kommandozeilen-Tools die direkt verwendet werden können. Außerdem ist *OpenSSL*  für alle gängigen OS frei erhältlich.

Verbindung auf Server (Servername und Port im Internet suchen, eine gute Übersicht bietet etwa https://www.pop3-imap-smtp.de/gmail/):

```
openssl s_client -connect smtp.gmail.com:465
openssl s_client -connect pop.gmail.com:995
openssl s_client -connect imap.gmail.com:993
```

Nachdem auf einen Server verbunden wurde kann im entsprechenden Protokoll kommuniziert werden. Falls eine Authentifizierung notwendig ist muss die auch entsprechend den Richtlinien des Anbieters erfolgen (User=Mail-Adresse oder ähnliches). Vorsicht ist mit der Groß-/Kleinschreibung geboten. Manche Befehle werden mit Fehlermeldung quittiert, die keinen Hinweis auf die Ursache bieten.

Für *GMAIL* (und obigen Account) gilt:

```
User: lolahillbilly39@gmail
PW: morgenistmontag1
```

(klassisch `telnet -z ssl smtp.gmail.com 465` ...).

### Base64

Beim Übertragen von Zeichen gibt's ein Problem mit der Darstellbarkeit in Editoren ... Aus diesem Grund werden die übertragenen Zeichen in 6Bit-Gruppen zusammengefasst (0-63) und dieser Zahl Zeichen zugeordnet: `A-Z, a-z, 0-9, +,/` diese Zeichen sind überall möglich.

https://de.wikipedia.org/wiki/Base64 beschreibt die Sache recht gut.

### Qt mit Sicherheitsprotokollen (SSL/TLS)

Für Qt kann während der Installation bei der Auswahl der zu implementierenden Toolkits die Installation von OpenSSL mit ausgewählt werden. OpenSSL ist notwendig damit von Qt aus mittels SSL/TLS kommuniziert werden kann. Alternativ kann OpenSSL separat installiert werden (siehe Oben). Die Verschlüsselungssoftware wird dynamisch gelinkt. Dafür müssen die notwendigen Bibliotheken (libcrypto, libssl) abschließend für die erstellte Applikation verfügbar sein. Dazu gibt es zwei Möglichkeiten:

- die Bibliothek ist in *c:\windows\system32* (oder ähnlichem Verzeichnis) abgelegt

- die Bibliothek ist direkt im Verzeichnis der erstellten Applikation abgelegt (build-Verzeichnis)
  Nachdem das Build-Verzeichnis eventuell für eine komplette Neuerstellung geleert/gelöscht wird, kann in die Qt-Projekt-Datei (*.pro-Datei) am Ende der Datei eingefügt werden, dass die Dateien jedes mal neu (aus dem Source-Verzeichnis) einkopiert werden (dazu werden *libcrypto-1_1-x64.dll* und *libssl-1_1-x64.dll* im Source-Verzeichnis abgelegt) in den Ordner mit dem Source Code kopieren:

  ```
  # Copy the dynamic library.
  win32 {
      QMAKE_PRE_LINK += QMAKE_COPY_FILE \"$$quote($$IN_PWD\libcrypto-1_1-x64.dll)\" \"$$quote($$OUT_PWD\debug)\" &
      QMAKE_PRE_LINK += QMAKE_COPY_FILE \"$$quote($$IN_PWD\libcrypto-1_1-x64.dll)\" \"$$quote($$OUT_PWD\release)\" &
      QMAKE_PRE_LINK += QMAKE_COPY_FILE \"$$quote($$IN_PWD\libssl-1_1-x64.dll)\"\"$$quote($$OUT_PWD\debug)\" &
      QMAKE_PRE_LINK += QMAKE_COPY_FILE \"$$quote($$IN_PWD\libssl-1_1-x64.dll)\"\"$$quote($$OUT_PWD\release)\" &
  }
  else {
     # TODO
  }
  ```

### Eigene Mailserver

Grundsätzlich ist es nicht sehr aufwändig einen eigenen Mailserver zu betreiben. Problematisch dabei ist, dass für andere Dienst-Anbieter gänzlich unbekannte Server ignoriert und deren Mails gelöscht werden. Es wäre auf diese Art sehr einfach Massenmails zu versenden oder Absende-Adressen zu fälschen.

## Mail Versand - SMTP

Mails können mittels **SMTP** Protokoll versendet werden.

1. Verbinden mit dem Mailserver. Für eine verschlüsselte Verbindung wird in Qt mittels *QSslSocket* verbunden (Ansonsten direkt mit *QTcpSocket*) (https://support.google.com/mail/answer/7104828):

   ```c++
   QSslSocket *m_sock = new QSslSocket();
   m_sock->connectToHostEncrypted("smtp.gmail.com",465);
   ```

   Laut SMTP-Protokoll antwortet der Server nach Annahme der Verbindung mit:

   ```
   220 smtp.gmail.com ESMTP r3sm25977716wrx.72 - gsmtp\r\n
   ```

   dabei 220="Server Ready", ESMTP=Erweitertes SMTP , gsmtp=GoogleSMTP, der unlesbare Teil ist eine Sitzungskennung.

   Allgemein wird für SMTP (als auch für POP3 später "\r\n" als Ende-Zeichen verwendet)

   Wenn eine solche Antwort empfangen wurde, kann fortgefahren werden:

2. Mittels dem geöffneten Socket wird ein Gruß gesendet (Extendet: ELHO):

   ```
   helo htl-salzburg.ac.at\r\n
   250 smtp.gmail.com at your service\r\n
   ```

   Damit gibt man sich als, in Teil der Domäne htl-salzburg.ac.at zu erkennen. Der Server antwortet mit

   250="OK".

3. Authentifizierung - in der SMTP Erweiterung sind mehrere Authentifizierungsmethoden möglich. Wir wählen die Methoden *LOGIN* (Base64 Codierung)

   ```
   auth login\r\n
   334 VXNlcm5hbWU6\r\n
   Versenden von ("lolahillbilly39@gmail.com".toUtf8().toBase64() + "\r\n")
   334 UGFzc3dvcmQ6\r\n
   Versenden von ("morgenistmontag1".toUtf8().toBase64() + "\r\n")
   235 2.7.0 Accepted\r\n
   ```

   334=Frage nach Benutzer/Passwort (die Zeichen sind Base64 zu konvertieren). Hier ist:

   ```
   "VXNlcm5hbWU6" ---base64decode--> "Username:"
   "UGFzc3dvcmQ6" ---base64decode--> "Password:"
   ```

   Entsprechend müssen Benutzer/PW ebenfalls Base64-kodiert übertragen werden.

4. Mail-Einstellungen - Absender, Empfänger und Inhalt:

   ```
   mail from:<lolahillbilly39@gmail.com>\r\n
   250 2.1.0 OK r3sm25977716wrx.72 - gsmtp\r\n
   rcpt to:<roman.schragl@htl-salzburg.ac.at>\r\n
   250 2.1.5 OK r3sm25977716wrx.72 - gsmtp\r\n
   data\r\n
   354  Go ahead r3sm25977716wrx.72 - gsmtp\r\n
   to:Roman Schragl<roman.schragl@htl-salzburg.ac.at>\r\n
   from:Jim Jones<lolahillbilly39@gmail.com>\r\n
   subject:MainHeader\r\nMailContent\r\n.\r\n
250 2.0.0 OK  1588069347 r3sm25977716wrx.72 - gsmtp\r\n
   quit\r\n
   221 2.0.0 closing connection r3sm25977716wrx.72 - gsmtp\r\n
   ```
   
   Wichtig: ".\r\n" beendet den Text (Protokoll)
   
   Die Anweisungen *MAIL FROM* und *RCPT TO* sind Informationen für die Übertragung, also für die Mailserver welche die Mails weiterleiten. Die *To* und *From* Anweisungen im *DATA* Bereich sind die Daten die letztlich beim Empfänger landen (hier kann auch BCC, CC ... gesetzt werden) (Stichwort "Envelope").

(Eventuell landet das versendete Mail in einem Spam-Filter --> Prüfen)

## Mail-Empfang - POP3

1. Verbinden mit dem Mailserver wie mit SMTP. Erzeugen eines QSslSocket und auf Port 995 verbinden (https://support.google.com/mail/answer/7104828):

   ```c++
   QSslSocket *m_sock = new QSslSocket();
   m_sock->connectToHostEncrypted("pop.gmail.com",995);
   ```

   Laut POP3-Protokoll antwortet der Server nach Annahme der Verbindung mit:

   ```
   +OK Gpop ready for requests from 217.149.167.104 i23mb384181980wrb\r\n
   ```

   Das erste Wort +OK bedeutet dass die Anmeldung in Ordnung ist.

2. Authentifizierung

   ```
   USER lolahillbilly39@gmail.com\r\n
   +OK send PASS\r\n
   PASS morgenistmontag1\r\n
   +OK Welcome.\r\n
   ```

3. Nun gibt es mehrere Optionen, hier werden einmal Beispielhaft:

   - der Status abgefragt
   - die Liste der Mails abgefragt

   ```
   STAT\r\n
   +OK 1 5504\r\n"
   LIST\r\n
   +OK 1 messages (5504 bytes)\r\n1 5504\r\n.\r\n"
   ```

   Dabei wird mit *STAT* angezeigt, dass 1 Nachricht und 5504Bytes verfügbar sind. Mit *LIST* wird eine Liste der verfügbaren Mails angezeigt, hier ist nur 1 Mail da, daher ist die Liste sehr kurz: 1 mit 5504Bytes Größe.

4. Abfrage von Mails (hier Mail Nr. 1):

   ```
   RETR 1\r\n
   +OK message follows\r\nDelivered-To: lolahillbilly39@gmail.com\r\nReceived: by 2002:a4a:d02c:0:0:0:0:0 with SMTP id w12csp5083913oor;\r\n        Tue, 28 Apr 2020 02:36:23 -0700 (PDT)\r\nX-Google-Smtp-Source: APiQypJU68+JUzVwLLYmFuSOk5YN591hCzuVzB2N1W5uotcSt8dWcHOC7OfiwOsQbq0crlPS0fOx\r\nX-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr3381904wmn.81.1588066583709;\r\n        Tue, 28 Apr 2020 02:36:23 -0700 (PDT)\r\nARC-Seal: i=1; a=rsa-sha256; t=1588066583; cv=none;\r\n        d=google.com; s=arc-20160816;\r\n        b=1GQ/9ZmHa69Akrdsoic4lmWTFjHOW8ZKJKtBD/OurG4wuoJxKE3DTjvGv/WgSjcHwV\r\n         sk3QJ4IyddiLsd3WbJuLdYKbT5n+TIjDik9YQDgimJIxAmu1rGpDLsyZ+AT7UkFD9oOR\r\n         whMFtLW8ie/MhJaFiuy/70uQgkLgjg2eJAYSPKG1cM34C82A09StCMH/WdQCJChOjoGN\r\n         z00O37y/KiUaQiZI6LdhGE6/b8mtCRH7F+WextD8nziGUeUUuUFUCQR/4TkVbExz06lA\r\n         E8sMirlTOz0CMYPXTqKz/WLP6f/FDxPCk9W9XXt9ulqGPHoiXjUdq6tAnNry7RPbHqqC\r\n         EPrg==\r\nARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;\r\n        h=content-transfer-encoding:mime-version:user-agent:date:message-id\r\n         :subject:from:to:dkim-signature;\r\n        bh=UBpuu4aExxp2ZXuZMlCspTR1Ydw6aTlvqeHmSn97AOw=;\r\n        b=mYR7xntdfToCTQuqkIJE6eKyhBHKOa3s3qVJ8CsF7qWB0dCvVSSrUYs5oLtTaiF0BR\r\n         kW8nxt1+3z+nLGMRfJZQUJA/Q+mI69SUOTPikNqEJqMYQQxIdrDEsHPxe/SVMBofBHBx\r\n         ZFEkuQ9SAEXTcqNRx0a6prpnKjnsDVgRKtFyNQiYjtLfBi7OhH/yaqrlEfHsFXT1Sxdm\r\n         lztQwwhU3UwonNpv4DIzLZGerA0sGZhhdhP+AcBpPGbZWRPg2abNHcbi8QbJghSnNNQA\r\n         meeicENVq8CeZcVcXdXBUG+Xs4XPt2FEmxJXb0rHx0O5qP7r9qGV1f9VzoGZFQ8z1I7n\r\n         uuTA==\r\nARC-Authentication-Results: i=1; mx.google.com;\r\n       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Y42RxIZa;\r\n       spf=pass (google.com: domain of roman.schragl@gmx.at designates 212.227.15.19 as permitted sender) smtp.mailfrom=roman.schragl@gmx.at\r\nReturn-Path: <roman.schragl@gmx.at>\r\nReceived: from mout.gmx.net (mout.gmx.net. [212.227.15.19])\r\n        by mx.google.com with ESMTPS id w9si19414227wrc.568.2020.04.28.02.36.23\r\n        for <lolahillbilly39@gmail.com>\r\n        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);\r\n        Tue, 28 Apr 2020 02:36:23 -0700 (PDT)\r\nReceived-SPF: pass (google.com: domain of roman.schragl@gmx.at designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;\r\nAuthentication-Results: mx.google.com;\r\n       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Y42RxIZa;\r\n       spf=pass (google.com: domain of roman.schragl@gmx.at designates 212.227.15.19 as permitted sender) smtp.mailfrom=roman.schragl@gmx.at\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;\r\n\ts=badeba3b8450; t=1588066583;\r\n\tbh=UBpuu4aExxp2ZXuZMlCspTR1Ydw6aTlvqeHmSn97AOw=;\r\n\th=X-UI-Sender-Class:To:From:Subject:Date;\r\n\tb=Y42RxIZa5nN8Mf2UUxahFRC+qNMGOV/AVw5vOftQXgYQxjTdc7zW5EZX1iAHWoivk\r\n\t q5hUu/iRV4AaJ5w7qqaO365vYI84xCd00wFzduJVvGckYHcoYItYD4192CEawWktY4\r\n\t jrW2VW2coZj6qlUotjcMZACaqFAWFRwFxFzvMbo8=\r\nX-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c\r\nReceived: from [10.0.0.5] ([217.149.160.44]) by mail.gmx.com (mrgmx005\r\n [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatRZ-1ivOgu0x6h-00cTX3 for\r\n <lolahillbilly39@gmail.com>; Tue, 28 Apr 2020 11:36:23 +0200\r\nTo: lolahillbilly39@gmail.com\r\nFrom: Roman Schragl <roman.schragl@gmx.at>\r\nSubject: Test\r\nMessage-ID: <8197133b-4461-6be5-d4ef-f98d9a09828f@gmx.at>\r\nDate: Tue, 28 Apr 2020 11:36:22 +0200\r\nUser-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101\r\n Thunderbird/68.7.0\r\nMIME-Version: 1.0\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: 7bit\r\nX-Provags-ID: V03:K1:X3JBFp+oyvxkel+EqXWy/aIZv6crG1Q09H8oIYj7y0I3uBSxY6Z\r\n xu6cAGdTqN8c2vqiXNTRVgsjKmFEg/mWzLjD1yCsTD2vhTsp7VXCMmOrP+WgFp7ZQoUhkkZ\r\n SIvcLWzschBjRSjo4+Jie6FSNWvfa0ZEuKjHId1vYY9tjTbiFOgupUCMzKDBx8bKVKO6DWk\r\n 8flK/eO+iE3pi3nBqfVwg==\r\nX-Spam-Flag: NO\r\nX-UI-Out-Filterresults: notjunk:1;V03:K0:jt/nvETMylQ=:wVLrn0dKUe9kkk+IGYZMT9\r\n 6iLUSwMdGl3puENy/g1zL+oWz7UNu/5lM/Q8sLarxDcPhgvVy0TXpZq70KhUfeYFuEcLXO9jf\r\n faOmrtZHKJcoXONav0N8bn6rUf3ngh0d2jsLr1yyAOXCaMO/8kcSWoyD93UvfkZgVOv89tdL5\r\n LesNUCtdY4+7+hui9Yhg4NRHPOnGnc0/O8yOtSArUMjb7NpPeGR4zBM26K31XYXpdrF/uLIYN\r\n ukfjFHMIS6do526h/VjWRr1HIdXZhB2So0r3J4aVc6VEXSaTfFMNeG49tO14LgE2h8Z62Jxqp\r\n 1FqT+DbVoizyuu0Yv8drOLr8OCst1qubM9VTK3obdQn1qwwptRmcM1hcNS/NxpTLbrfis8BzZ\r\n UYDEVPCZfe47CitzS8uI6v0WI9dtB2lIFljorAPhWb7TDfrGQUXto9z8VIlt+gPfjCpneUcQ3\r\n l+ADSqmGuW4i5GlO1r/LfTnCzLN2FXgy8PivFtNPDum7iLH+IDqSFHxoHklGgjBimGjQAnlZj\r\n qrwdkYHd9d5tZzbGY5Uux7+3yPHYExtQk3yyzegJvZGuqV4QJ/vPWMOJeOgEieTMjU/G8Ril4\r\n SsboNClME0gONrVRDexnTVy5+303eSEg98IhcLerVJj6qs1yJGzdabQQE3cbqIl0u2r7H6tTg\r\n FqsKZfOpxQeSfl7NZOxLiU+Rmji5raGuMFUCLvc/ovyeg+UrXjrOELq7Rq7hzp9IDLiKXDyMX\r\n PJrOnpISeKZ5XH4Rc6rZlURHAMC3JksomkeGqEIXnrzPoFnjaR2QvhPYUAYlMg87as9SXsqMu\r\n a3p+o00qVaRUV0ShjNcVqocwo6VP24rL1CepKlYajcemWHIZ9WqoXXea/TxoL26N5Ci5yiKWt\r\n A04q7tKrB6yaCR5bpjsE3ZZjoCVciO0KU3KGINwPa/XuQuuj0wbiUWxPZeauRTbAt6gqOYicV\r\n N6+MSJaSr75RL+HCroUADGHyG09ULY75QweLlw3yH4zMoqH0wkj30jNjaczShP/QNwLJdsj36\r\n bXPk+JvItjikFTfEc91aKWizID0rFxO6qmZ4O+06pCxzZTWdeH+sSk5CfbEOrfyDrcKTgIkIy\r\n TWxj0IpOzHEfO3NYVilJL8M8iV+h8EjbJr21UFm2n73Gpbl1WgVe9K1WGuqdesjmwpuQyPMO/\r\n e9s0Uy2SdZwvQIkEsuKpNV1JbiN7bhhyqYKwpJzmq11LaljIiUl19GX9cOKhsjYDM/MRRXJaA\r\n SBwa5EH2uz83ZnEfLM10G3GfpOKPySWYpsdv4JIkSAQknSOBsZrmDnxU8HuS8jlMlubn4hJKT\r\n fUfWBXQBjzsCkNMExixothVKlbklvCmh0LYPO5iYzDbHOlxjoiViHoBVu6tCTjW5zJY7vnYNp\r\n D5hobM/gvyme2xltxvoLKSxVKt8j8j0bO25kMtFbPqYW2X90Vf4TJEazrmSGFCezvnI9pkefk\r\n +XQsGmrNP4iw==\r\n\r\nDas ist ein Testmail\r\n\r\n.\r\n
   ```

   Es ist ersichtlich, dass eine große Menge an Daten empfangen wird. Das Mail selber wurde von

   - "*roman.schragl@gmx.at*" gesendet und hat ein
   - Subject "*Test*"
   - Content "*Das ist ein Testmail*"

   Die Übertragung wird je nach Länge auf mehrere Übertragungen aufgeteilt und wird mit ".\r\n" beendet.

## Mail-Empfang - IMAP

Auf GMail können E-Mails mittels POP3 oder IMAP Protokoll empfangen werden.

1. Verbinden mit dem Mailserver wie mit SMTP. Dazu wird ein QSslSocket erzeugt und auf Port 993 verbunden (https://support.google.com/mail/answer/7104828):

   ```c++
   QSslSocket *m_sock = new QSslSocket();
   m_sock->connectToHostEncrypted("imap.gmail.com",993);
   ```

   Laut IMAP-Protokoll antwortet der Server nach Annahme der Verbindung mit:

   ```
   * OK Gimap ready for requests from 217.149.167.202 k188mb476238095wma\r\n
   ```

   Das erste Wort *OK bedeutet dass die Anmeldung in Ordnung ist.

2. Authentifizierung

   ```
   A01 login lolahillbilly39@gmail.com morgenistmontag1\r\n
   ...
   ```

3. Nun gibt es mehrere Optionen, hier werden einmal Beispielhaft:

   - Liste von Ordnern
   - Inhalt der inbox

   ```
   A01 list \"\" \"*\"\r\n
   ...
   A01 examine inbox\r\n
   ...
   ```

4. Abfrage von Mails (hier Mail Nr. 1):

   ```
   A01 fetch 1 body[]\r\n
   ```

## Mail-Programm mit C++ (c++490)

```c++
#include <iostream>
#include <stdio.h>
#include <memory.h>
#include <errno.h>
#include <sys/types.h>
#include <winsock2.h>
#include <openssl/crypto.h>
#include <openssl/x509.h>
#include <openssl/pem.h>
#include <openssl/ssl.h>
#include <openssl/err.h>

#define CHK_NULL(x) if((x)==NULL) exit(1)
#define CHK_ERR(err,s) if((err)==-1) { perror(s); exit(1); }
#define CHK_SSL(err) if((err)==-1) { ERR_print_errors_fp(stderr); exit(2); }

SSL *ssl;
char buf[4096];

const char user[] = "lolahillbilly39@gmail.com";
const char pw[] = "morgenistmontag1";


#include <string>

static const unsigned char base64_table[65] =
  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

/**
* base64_encode - Base64 encode
* @src: Data to be encoded
* @len: Length of the data to be encoded
* @out_len: Pointer to output length variable, or %NULL if not used
* Returns: Allocated buffer of out_len bytes of encoded data,
* or empty string on failure
*/
std::string base64_encode(const unsigned char *src, size_t len)
{
  unsigned char *out, *pos;
  const unsigned char *end, *in;

  size_t olen;

  olen = 4*((len + 2) / 3); /* 3-byte blocks to 4-byte */

  if (olen < len)
    return std::string(); /* integer overflow */

  std::string outStr;
  outStr.resize(olen);
  out = (unsigned char*)&outStr[0];

  end = src + len;
  in = src;
  pos = out;
  while (end - in >= 3) {
    *pos++ = base64_table[in[0] >> 2];
    *pos++ = base64_table[((in[0] & 0x03) << 4) | (in[1] >> 4)];
    *pos++ = base64_table[((in[1] & 0x0f) << 2) | (in[2] >> 6)];
    *pos++ = base64_table[in[2] & 0x3f];
    in += 3;
  }

  if (end - in) {
    *pos++ = base64_table[in[0] >> 2];
    if (end - in == 1) {
      *pos++ = base64_table[(in[0] & 0x03) << 4];
      *pos++ = '=';
    }
    else {
      *pos++ = base64_table[((in[0] & 0x03) << 4) |
                            (in[1] >> 4)];
      *pos++ = base64_table[(in[1] & 0x0f) << 2];
    }
    *pos++ = '=';
  }

  return outStr;
}

void write(const char *s)
{
  int err = SSL_write(ssl, s, strlen(s));
  printf("> %s\n", s);
  CHK_SSL(err);
}

void read()
{
  int n = SSL_read(ssl, buf, sizeof(buf) - 1);
  CHK_SSL(n);
  if(n==0)
  {
    int e = SSL_get_error(ssl, 0);
    printf("Read error %i\n", e);
    exit(1);
  }
  buf[n] = 0;
  printf("%s\n", buf);
}

void pop() {
  read();
  std::string str;
  str += "USER ";
  str += user;
  str += "\r\n";
  write(str.c_str());
  read();
  str = "";
  str += "PASS ";
  str += pw;
  str += "\r\n";
  write(str.c_str());
  read();
  write("STAT\r\n");
  read();
  write("LIST\r\n");
  read();
  write("RETR 1\r\n");
  read();
  read();
  read();
  read();

}
void imap() {
  read();
  std::string str;
  str += "A01 login ";
  str += user;
  str += " ";
  str += pw;
  str += "\r\n";
  write(str.c_str());
  read();
  write("A01 list \"\" \"*\"\r\n");
  read();
  write("A01 examine inbox\r\n");
  read();
  write("A01 fetch 1 body[]\r\n");
  read();
  read();
  read();
  read();
  read();
  read();
  read();
  read();
  read();

}
void smtp(char *dta) {
  read();
  write("HELO hellogoogle\r\n");
  read();
  write("AUTH LOGIN\r\n");
  read();
  write((base64_encode(user,sizeof(user)-1) + "\r\n").c_str());
  read();
  write((base64_encode(pw,sizeof(pw)-1) + "\r\n").c_str());
  read();
  write("MAIL FROM: <srar.htl@gmail.com>\r\n");
  read();
  write("RCPT TO:<roman.schragl@htl-salzburg.ac.at>\r\n");
  read();
  write("DATA\r\n");
  read();
  write(dta);
  write("\r\n.\r\n");
  read();
  write("QUIT\r\n");
  read();
}

int main()
{
  int selection = 0;
  printf("Waehler Sie:\n 0=Senden(SMTP)\n 1=Empfangen 1.Mail(POP3)\n 2=Empfangen 1.Mail(IMAP)\n:");
  scanf("%i", &selection);

  int err=0;

  SSLeay_add_ssl_algorithms();
  SSL_METHOD *meth = SSLv23_client_method();
  SSL_load_error_strings();
  SSL_CTX *ctx = SSL_CTX_new(meth);
  CHK_NULL(ctx);

  WSADATA data;
  WSAStartup(0x202, &data);

  int sd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
  CHK_ERR(sd, "socket");

  struct sockaddr_in sa;
  memset(&sa, 0, sizeof(sa));
  sa.sin_family      = AF_INET;

  if (selection == 0) {
    // smtp
    sa.sin_addr.s_addr = inet_addr("108.177.15.109");
    sa.sin_port = htons(465);
  }
  else if (selection == 1) {
    // pop
    sa.sin_addr.s_addr = inet_addr("74.125.133.108");
    sa.sin_port = htons(995);
  }
  else if (selection == 2) {
    // imap
    sa.sin_addr.s_addr = inet_addr("172.253.120.108");
    sa.sin_port = htons(993);
  }

  err = connect(sd,(struct sockaddr*) &sa, sizeof(sa));
  CHK_ERR(err, "connect");

  /* ----------------------------------------------- */
  /* Now we have TCP connection. Start SSL negotiation. */

  ssl = SSL_new(ctx);
  CHK_NULL(ssl);
  SSL_set_fd(ssl, sd);
  err = SSL_connect(ssl);
  CHK_SSL(err);

  if (selection == 0) {
    smtp("Subject: Test\r\nMail");
  }
  else if (selection == 1) {
    pop();
  }
  else if (selection == 2) {
    imap();
  }

  SSL_shutdown(ssl);

  closesocket(sd);
  SSL_free(ssl);
  SSL_CTX_free(ctx);
}
```

## Referenzen

- RFC821 SMTP-Standard
  https://tools.ietf.org/html/rfc821
  RFC1869 ESMTP-Standard
  https://tools.ietf.org/html/rfc1869
  Es gibt mehrere SMTP-Standard-Erweiterungen, in Wikikpedia sind diese brauchbar verlinkt.

- RFC1939 - POP3-Standard
  https://tools.ietf.org/html/rfc1939

- Base64-Umwandlung
  https://www.base64decode.org/
- OpenSSL - Windows-Binaries 32 und 64 Bit, die Nicht-Light-Version beinhaltet neben Bibliotheken auch Tools
  http://slproweb.com/products/Win32OpenSSL.html
- Aufbau Mail Senden (Envelope ...)
  https://www.msxfaq.de/internet/envelope.htm