# MATLAB

## Matlab Basics

```matlab
%% clean up
close all;
clearvars;
clc;

%% Eingabe numerischer Ausdruecke in die Kommandozeile
7 / (2.51^2 - 0.3)

%% Einfache Variablen-Zuweisung
a = 12*4                % sonst Zuweisung nach 'ans' (wie oben)

% Kommandozeilen-History und Strichpunkt am Zeilenende
a = 12*4;

%% Vordefinierte Variablen
pi 
i
j

%% Matrizen
A = [1,2,3 ; i,pi,0]

%%
size(A) % Zeilen, Spalten

% auch ein Skalar wird als Matrix betrachtet
size(a)

%% Einfache Matrizen
B = zeros(3,4) % wird oft zum Initialisieren verwendet

%% bzw. einfache Vektoren
b = 3*ones(1,8) % Zeilenvektor
b = -ones(8,1) % Spaltenvektor

%% arithmetische Folge (1. Bedeutung des :-Operators)
c = 1:3       % Default-Inkrement 1
d = 3:2:19
e = 20:-2:4   % auch negatives Inkrement. Kann auch nicht-ganzzahlig sein.

%% Indizierung (BEGINNT MIT 1!!!)
A(2,1) % 2. Zeile, 1. Spalte
A(5) % 5. Element (entlang der Spalten, Spalte-fuer-Spalte)
A(2,3)=1 % schreiben auf indiziertes Element

%% Vektor als Index (Ergebnis hat gleiche Dimension wie Indexvektor)
A(2,2:3)
A(c) % entlang der Spalten

%% Indizierung ALLER Elemente (2. Bedeutung des :-Operators)
A(2,:) % ALLE Elemente der 2. Zeile
A(:) % ALLE Elemente als Spaltenvektor

%% Indizierung bis zum Ende
A(2:end)

% Transposition
A' % Transposition UND Konjugation (Hermitesche Transposition)
A.' % nur Transposition

%% Zusammensetzen von Vektoren bzw. Matrizen
C = [d; e] % 2 Zeilenvektoren uebereinander (gleiche Anzahl an Spalten!)
[C,ones(2,3)] % 2 Matrizen nebeneinander (gleiche Anzahl an Zeilen!)

%% Matrixmultiplikation
A * [0;1;2] % Groessen muessen passen! (Z1,S1) mal (Z2=S1,S2) ergibt (Z1,S2)
[1;2;3] * [1,2,3] % Spaltenvektor mal Zeilenvektor ergibt Matrix
[1,2,3] * [1;2;3] % Zeilenvektor mal Spaltenvektor ergibt Skalarprodukt

%% Element-fuer-Element-Operatoren (keine Schleifen!)
D = A .^ 2 % Quadrat aller Elemente
E = A .^ A % beide Operanden gleich gross!
F = D .* E % beide Operanden gleich gross! (z.B. MODULATOR)
D + E % beide Operanden gleich gross!
D - E % beide Operanden gleich gross!

%% nicht nur Operatoren arbeiten mit Matrizen bzw. Vektoren - auch Funktionen!
% Signalgenerierung in der zeitdiskreten Signalverarbeitung:
n = 0:49;  % Zeitvektor
x = cos( pi/20 * n); % Ergebnis ist auch Vektor - keine Schleife notwendig!

%% Plots
stem(n,x)
plot(n,x) % lin. Interpolation

%% WORKSPACE
who % Auflisten aller Variablen im Workspace

%%
clear all
who % Workspace ist nun leer

%% Programmieren in MATLAB: SKRIPTFILES
edit
% Skriptfiles:
%  .) verwendet MATLAB-Workspace fuer Variablen (bleiben sichtbar)
%  .) z.B. fuer Hauptprogramm einer Simulation
%  .) einfach als 'skriptname.m' abspeichern
%  .) mittels '>> skriptname' in der Kommandozeile starten
%  .) '%' fuer einzeilige Kommentare, Doku, ...

%% BEISPIELSKRIPT
% Exponentialfolge
n = 0:49;  % Zeitvektor
h = 0.9 .^ n;
subplot(3,1,1)
stem(n,h)

% einfaches periodisches Signal
p = [ ones(1,5), -ones(1,5) ]; % 1 Periode der Laenge 10
p = repmat(p,1,5); % 5 Perioden hintereinander
subplot(3,1,2)
stem(n,p)

% etwas Signalverarbeitung
y = filter( h, 1, p); % FIR Filter
subplot(3,1,3)
stem(n,y)

%% HILFE
help plot % aehnliche Funktionen unter "See also"

%%
help fft

%%
help signal % Signal Processing Toolbox

%%
lookfor convolution % apropos

%%
doc % Browser

%% EIGENE FUNKTIONEN
%  .) jede Funktion hat ihren eigenen (temporaeren) Workspace fuer Variablen
%  .) SYNTAX:
%
%     function [result1, result2] = funktionsname( arg1, arg2, arg3 )
%     % DOKU UNMITTELBAR NACH PROTOTYP! (Beschreibung, Argumente, ...)
%     % DOKU wird mittels '>> help funktionsname' ausgegeben
%
%  .) als 'funktionsname.m' abspeichern
help function

%% Bedingte Ausfuehrung
help if % if, elseif, else, end

%% Bool'sche Operatoren
help relop

%% auch Bool'sche Operatoren koennen auf Vektoren/Matrizen angewendet werden!
help switch % switch, case, otherwise, end

%% Schleifen (SPARSAM VERWENDEN !!!)
% Z.B. fuer Blockverarbeitung extrem langer Signale oder im Allgemeinen,
% um Speicherbedarf in Grenzen zu halten.
help for

%%
help while

```

### Plots

```matlab
x = linspace(0,10,11);
y = sin(x); 

figure() % Öffnet neues Fenster für plotting
subplot(2,3,1) % 2x3 grid an subplots. Der nächste plot ist an position 1
plot(x, y, 'x:', 'Linewidth', 3pt)
title('This is an intepolated sinewave')
xlim([-2 2])
ylim([-1 8])
xlabel('x')
ylabel('y')

subplot(2,3,2)
stem(x, y, '--o', 'Linewidth', 3pt)
title('This is a time discrete sinewave')
```

## Matlab im Terminal

```sh
matlab -nosplash -nodesktop
```

# MATLAB auf Arch Installieren

> [!info] RTFM - [MATLAB - ArchWiki](https://wiki.archlinux.org/title/MATLAB)

## 1. MPM Installieren

- [mpm - Download](https://www.mathworks.com/mpm/glnxa64/mpm)
- Ausfühbar machen:`chmod -x mpm`
- Symlink (`ln -s`) oder Moven (`mv`) nach`usr/local/bin` (damit der command `mpm` ohne Pfad ausgeführt werden kann)

## 2. Pakete Installieren

Standard verzeichnis: `/usr/local/MATLAB`

```sh
mpm install --release=R2024b MATLAB [packages]
```

Liste von Packages: [matlab-dockerfile/mpm-input-files- GitHub](https://github.com/mathworks-ref-arch/matlab-dockerfile/tree/main/mpm-input-files)

## 3. Lizenz installieren

Erstmaliges Öffnen (mit sudo damit das Lizenz-File im Installationsverzeichnis angelegt werden kann)

```sh
sudo matlab
```

-> **Anmelden**

## 4. Trouble Shooting

### Glibc 2.41 issues

- [Problem with Matlab 'Service' / AUR Issues, Discussion & PKGBUILD Requests / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=303177)

Im 2. Command `user` und die Version anpassen.

```sh
sudo pacman -S patchelf
sudo patchelf --clear-execstack /home/simon/.MathWorks/ServiceHost/-mw_shared_installs/v2025.1.1.2/bin/glnxa64/libmwfoundation_crash_handling.so
sudo patchelf --clear-execstack /home/simon/.MathWorks/ServiceHost/-mw_shared_installs/v2025.1.1.2/bin/glnxa64/mathworksservicehost/rcf/matlabconnector/serviceprocess/rcf/service/libmwmshrcfservice.so
```

### GLExeption

- [MATLAB - ArchWiki](https://wiki.archlinux.org/title/MATLAB#X11GLXDrawableFactory_-_Could_not_initialize_shared_resources_for_X11GraphicsDevice)
- Hardware Rendering probleme

im Ausführverzeichnis von `matlab` 

