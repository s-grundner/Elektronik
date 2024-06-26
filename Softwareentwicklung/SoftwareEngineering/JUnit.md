# JUnit

# Theorie

> [!question] Was versteht man unter Black-Box-Testen? Was versteht man unter White-Box-Testen?
?
> > [!success]- Lösung
> > Black-Box / Schnittstellentest: Nur das Schnittstellenverhalten eines Systems wird getestet
> > White-Box / Strukturtest: Innere Struktur des Testobjekts wird berücksichtigt


> [!question] Beim Testen spricht man von Black Box- und White Box-Testen. Erläutern Sie das Vorgehen bei diesen beiden Testarten.
?
> > [!success]- Lösung
> > Black-Box: 
> > - Quellcode wird ignoriert
> > - Testfälle werden nur aus der Schnittstelle bzw. der Spezifikation abgeleitet.
> > White-Box:
> > - Quellcode der zu testenden Einheit (z.B. Methode) wird analysiert
> > - Testfälle müssen alle Abdeckungsarten erfülle


> [!question] Erklären Sie in einer kurzen Beschreibung die Prinzipien von JUnit-Tests. 
> 
?
> > [!success]- Lösung
> > Testprogramm, muss folgendes erfüllen:
> > - Ausführung aller Operationen
> > - Zugriff auf verschiedene Programmzustände
> > - überprüfen auf korrekte Resultate mit `assert`


> [!question] Welche Abdeckungsarten beim White-Box Testen kennen Sie?
?
> > [!success]- Lösung
> > - **Anweisungsabdeckung**
> > - **Bedingungsabdeckung**
> > - **Pfadabdeckung**