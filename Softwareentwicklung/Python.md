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

## Primitive Datentypen und Operatoren

```python
#########################################
## 1. Primitive Datentypen und Operatoren
######################################### # Die Zahlen
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
####################################################
## 3. Kontrollstruktur und Iteratoren 3 ####################################################

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
li.append(3) # li ist jetzt wieder [1, 2, 4, 3]. 5 6 # Greife auf Listen wie auf Arrays zu 7 li[0] #=> 1 8 # Das letzte Element ansehen 9 li[-1] #=> 3

```