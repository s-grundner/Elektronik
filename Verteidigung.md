# Titelfolie

# Einleitung 

# Team Arbeitsaufteilung
Daniel
- Analog Frontend
Simon
- Hardware Frontend Platine
- Firmware Development
Laurenz
- Firmware Development
- Digitale Signalverarbeitung

# Blockschaltbild

# Signalkette

Wellenform einer Gitarrensaite
- Gitarren Pickups
- Wellenform
- Spektrum

Analog
- Audio Eingang
- AFE

Digital am ESP32
- Einlesen
- Samplen
- FFT
- Notenerkennung
- MIDI Formatierung
- MIDI via UART

USB Schnittstelle
- USB UART Bridge

Software am PC
- MIDI Serial Bridge
- MIDI Virtual Port
- Port al Schnittstelle zu Ableton
- Empfangen in Ableton



# Firmware
- Programmierung mit
	- ESP IDF
	- PlatformIO
	- in C

# Hardware
- Filter
- ESP32
- USB-Bridge
- Versorgung (LDO)

# CAD