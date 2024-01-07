---
tags:
  - Python
aliases:
  - "#Python"
created: 7. Januar 2024
---

# Python Grundlagen

## Kommentare

```python
# Einzeilige Kommentare beginnen mit einer Raute (Doppelkreuz)

""" Mehrzeilige Strings werden mit
	4 drei "-Zeichen geschrieben und 
	werden 5 oft als Kommentare genutzt.
"""
```

## Primitive [Datentypen](Datentypen.md) und Operatoren

```python
# Die Zahlen
3 #=> 3

# Mathematik funktioniert so, wie man das erwartet
1 + 1 #=> 2
8 - 1 #=> 7
10 * 2 #=> 20

# Außer Division, welche automatisch Gleitkommazahlen zurückgibt
35 / 5 # => 7.0

# Der Rest einer Division (Modulo)
7 % 3 # => 1

# Potenz
2**4 # => 16

# Rangfolge wird mit Klammern erzwungen
(1 + 3) * 2 #=> 8
```

### Boolesche Operatoren

```python
# Boolesche Ausdrücke sind primitive Datentypen
True
False

# Mit not wird negiert
not True #=> False
not False #=> True

# Boolesche Operatoren
# Hinweis: "and" und "or" müssen klein geschrieben werden
True and False #=> False
False or True #=> True

# Gleichheit ist ==
1 == 1 #=> True
2 == 1 #=> False

# Ungleichheit ist !=
1 != 1 #=> False
2 != 1 #=> True

# Ein paar weitere Vergleiche
1 < 10 #=> True
1 > 10 #=> False
2 <= 2 #=> True
2 >= 2 #=> True
```

## Strings

```python
# Strings werden mit " oder ' gebildet
"Das ist ein String."
'Das ist auch ein String.'

# Strings können auch addiert werden! Vermeide dies aber lieber.
"Hallo " + "Welt!" #=> "Hallo Welt!"

# Strings können ohne "+" addiert werden
"Hallo " "welt!" # => "Hallo Welt!"
# Ein String kann wie eine Liste von Zeichen verwendet werden
"Das ist ein String"[0] #=> 'D' 

# .format kann Strings formatieren
"{} können {} werden".format("Strings", "formatiert") 15 #=> "Strings können formatiert werden"
```

## If

```python
# Erstellen wir mal eine Variable
some_var = 5

# Hier eine if-Anweisung. Die Einrückung ist in Python wichtig!
# gibt "some_var ist kleiner als 10" aus
if some_var > 10:
	print("some_var ist viel größer als 10.")
elif some_var < 10: # Dieser elif-Absatz ist optional.
	print("some_var ist kleiner als 10.")
else: # Das hier ist auch optional.
	print("some_var ist tatsächlich 10.")
```

## Listen

```python
# Listen speichern Sequenzen
li = [] 3 # Wir können mit einer bereits gefüllten Liste anfangen
other_li = [4, 5, 6] 5 6 # append fügt Daten am Ende der Liste ein
li.append(1) #li ist jetzt [1]
li.append(2) #li ist jetzt [1, 2]
li.append(4) #li ist jetzt [1, 2, 4]
li.append(3) #li ist jetzt [1, 2, 4, 3]

# Vom Ende der Liste mit pop entfernen
li.pop() #=> 3 und li ist jetzt [1, 2, 4]

# und dann wieder hinzufügen
li.append(3) # li ist jetzt wieder [1, 2, 4, 3].

# Greife auf Listen wie auf Arrays zu
li[0] #=> 1

# Das letzte Element ansehen
li[-1] #=> 3
```

## For-Schliefe

```python
"""
For-Schleifen iterieren über Listen
Ausgabe:
	hund ist ein Säugetier
	katze ist ein Säugetier
	maus ist ein Säugetier
"""
for animal in ["hund", "katze", "maus"]:
# Wir können Strings mit format() formatieren
	print("{} ist ein Säugetier".format(animal))
```

### range()

```python
"""
`range(Zahl)` gibt eine null-basierte Liste bis
exklusive der angegebenen Zahl wieder
Ausgabe: 5 0 6 1 7 2 8 3 9
"""
for i in range(4):
	print(i)

```

## While-[Schleifen](Schleifen.md)

```python
"""
While-Schleifen laufen, solange eine Bedingung erfüllt ist.
Ausgabe:
	0 5 1 6 2 7 3 8
"""
x = 0
while x < 4:
	print(x)
	x += 1 # Kurzform für x = x + 1
```

## Funktionen

```python

# Mit def neue Funktionen erstellen
def add(x, y):
	print("x ist %s und y ist %s" % (x, y))
	return x + y # Werte werden mit return zurückgegeben
	
# Funktionen mit Parametern aufrufen
add(5, 6) #=> Ausgabe ist "x ist 5 und y ist 6" und gibt 11 zurück

# Ein anderer Weg des Funktionsaufrufs sind Schlüsselwort-Argumente
add(y=6, x=5) # Überg. v. Schlüsselw. in beliebiger Reihenf. mögl.
```

## Dictionary

```python
# Dictionaries (Wörterbucher) speichern Schlüssel-Werte-Paare
empty_dict = {} 3 # Hier ein gefülltes Wörterbuch
filled_dict = {"one": 1, "two": 2, "three": 3}

# Wir können Einträge mit [] nachschlagen
filled_dict["one"] #=> 1

# So holen wir alle Keys (Schlüssel) als Liste
list(filled_dict.keys()) #=> ["three", "two", "one"]

# Hinweis - Die Reihenfolge von Schlüsseln in der Liste ist
# nicht garantiert.
# Einzelne Resultate können anders angeordnet sein.

# Alle Values (Werte) als Liste
list(filled_dict.values()) #=> [3, 2, 1]
# Hinweis - Hier gelten dieselben Einschränkungen für die
# Reihenfolge wie bei Schlüsseln.
```