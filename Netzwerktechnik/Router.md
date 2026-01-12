---
tags: []
aliases: []
created: 10. März 2024
---

# Router

Um Dienste im Internet in Anspruch nehmen zu können, ist ein Router notwendig. Dazu werden interne IP-Adressen in diejenige Adresse übersetzt, die zum Beispiel vom Internet-Provider zur Verfügung gestellt wird. Das kann entweder statisch (fest eingestellt) oder dynamisch ([DHCP](../Protokolle/DHCP.md)) erfolgen. Router haben vielfach noch zusätzliche Optionen - Firewall, Filterung …

![NW_Hub](../_assets/NW_Router.png)

Wenn vom Datennetzanbieter kein Netzwerk angeboten wird sondern ein anderes Medium (Telefon, Fernsehkabel …), dann ist zusätzlich zwischen Router und Internet ein **Modem** notwendig. Ein Modem (*Mod*ulator-*Dem*odulator) adaptiert zum Beispiel [Ethernet](../Ethernet.md) auf eine Telefonleitung oder ein Fernsehkabel.

Klassisch war es dann häufig auch notwendig, dass die Telefonleitung auf das Telefonsignal und Internetsignal aufgeteilt wurde (bevor es ins Modem kam), das erfolgte durch einen **Splitter**.

Im Privat-Bereich sieht die Gerätestruktur oft viel einfacher aus, das liegt daran, dass die oben erwähnten Komponenten komplett in ein einzelnes Gerät zusammengefasst werden, diese Geräte werden dann oft als **I**ntegrated **A**ccess **D**evice (IAD) bezeichnet. Oft ist aber in einen Access Point direkt ein Switch integriert. Ebenfalls auch in einem Router, dann haben diese Geräte gleich mehr als nur die beiden gezeigten Anschlüsse.