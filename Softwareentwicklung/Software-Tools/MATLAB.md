
# MATLAB

```m

addi s0, a, 6 

Add:

C-Code: a = b + c 
RSIC-V Assembler: add a, b, c

Sub:

C-Code: a = b - c 
RISC-V Assembler: sub a, b, c

Meherere Befehle

C-Code: a = b + c - d
RV-Assembler:
- add t, b, c
- sub a, t, d

```

## Matlab im Terminal

```sh
matlab -nosplash -nodesktop
```

# MATLAB auf Arch Installieren

- [MATLAB - ArchWiki](https://wiki.archlinux.org/title/MATLAB)
- [Problem with Matlab 'Service' / AUR Issues, Discussion & PKGBUILD Requests / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=303177)

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

