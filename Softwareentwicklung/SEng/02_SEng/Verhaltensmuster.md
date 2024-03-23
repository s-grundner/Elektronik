---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester:
  - SS24
  - B2
created: 23. März 2024
professor:
---
 

# Verhaltensmuster

## Observer

[Beobachter (Entwurfsmuster) – Wikipedia](https://de.wikipedia.org/wiki/Beobachter_(Entwurfsmuster))

Ein Observer gehört zur Gruppe der **Verhaltensmuster**. Er wird verwendet um Veränderungen (an `mState`) an einem Objekt (Subject) an von diesem Objekt abhängige Objekte (`Observer`) weiter zu melden.

- Ein Observer muss sich zu diesem Zweck bei dem Subject anmelden:  
  Subject: Methode `registerObserver()`: damit wird ein weiterer Observer in eine Observer-Liste `mObserver` eingefügt (Aggregationsbeziehung)
- Ein Observer muss sich abmelden, wenn er nicht mehr informiert werden soll:  
  Subject: Methode `removeObserver()`: Entfernen eines Observer aus der Liste
- Subject: Methode `notify()`: nach jeder Veränderung ruft Subject diese selber auf und ruft damit für jeden gelisteten Observer die Methode `update()` auf.
  - Das Subject sendet in der `update()` Funktion sich selbst als Parameter oder die gewünschte Informationen (push-Variante).
  - Eine zweite Variante ist es, mit `update` den Observer darauf aufmerksam zu machen, dass es neue Daten gibt - diese können dann nach Bedarf mit einem Getter `getState` vom `ConreteSubject` abgerufen werden (pull-Variante).
- Observer: mit der `update()`-Methode wird die `getState()` Methode des Subject aufgerufen um die notwendigen Daten abzurufen.

Ein Observer ist eine *Eins-zu-Viele-Abhängigkeit* (Ein Subject <-> Viele Observer).

![invert_dark](assets/UML_Pattern_Observer.png)

## Iterator

Ein **Iterator** gehört zur Gruppe der Verhaltensmuster. Dieses Muster sei hier erwähnt, die Anwendung und Funktion ist in Standard-Template-Library für die Collections implementiert.

