# CLion - WSL - Valgrind

## WSL Installieren

- Windows-Store - Suche nach *Ubuntu*

- Powershell als Administrator öffnen (Erlauben des Ausführens):

  ```
  dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  ```

  Neustart notwendig
  
- Starten, dabei wird Ubuntu installiert.

  - ubuuser - comein

- Im Home-Verzeichnis

  ```
  nano wsl_init.sh
  ```

  diesen Teil einfügen (https://github.com/JetBrains/clion-wsl/blob/master/ubuntu_setup_env.sh):

  ```
  #!/bin/bash
  set -e
  
  SSHD_LISTEN_ADDRESS=127.0.0.1
  if [ -e "/dev/vsock" ]; then # in case of WSL2
  	SSHD_LISTEN_ADDRESS=0.0.0.0
  fi
  
  SSHD_PORT=2222
  SSHD_FILE=/etc/ssh/sshd_config
  SUDOERS_FILE=/etc/sudoers
    
  # 0. update package lists
  sudo apt-get update
  
  # 0.1. reinstall sshd (workaround for initial version of WSL)
  sudo apt remove -y --purge openssh-server
  sudo apt install -y openssh-server
  
  # 0.2. install basic dependencies
  sudo apt install -y cmake gcc clang gdb valgrind build-essential
  
  # 1.1. configure sshd
  sudo cp $SSHD_FILE ${SSHD_FILE}.`date '+%Y-%m-%d_%H-%M-%S'`.back
  sudo sed -i '/^Port/ d' $SSHD_FILE
  sudo sed -i '/^ListenAddress/ d' $SSHD_FILE
  sudo sed -i '/^UsePrivilegeSeparation/ d' $SSHD_FILE
  sudo sed -i '/^PasswordAuthentication/ d' $SSHD_FILE
  echo "# configured by CLion"      | sudo tee -a $SSHD_FILE
  echo "ListenAddress ${SSHD_LISTEN_ADDRESS}"	| sudo tee -a $SSHD_FILE
  echo "Port ${SSHD_PORT}"          | sudo tee -a $SSHD_FILE
  echo "UsePrivilegeSeparation no"  | sudo tee -a $SSHD_FILE
  echo "PasswordAuthentication yes" | sudo tee -a $SSHD_FILE
  # 1.2. apply new settings
  sudo service ssh --full-restart
    
  # 2. autostart: run sshd 
  sed -i '/^sudo service ssh --full-restart/ d' ~/.bashrc
  echo "%sudo ALL=(ALL) NOPASSWD: /usr/sbin/service ssh --full-restart" | sudo tee -a $SUDOERS_FILE
  cat << 'EOF' >> ~/.bashrc
  sshd_status=$(service ssh status)
  if [[ $sshd_status = *"is not running"* ]]; then
    sudo service ssh --full-restart
  fi
  EOF
    
  
  # summary: SSHD config info
  echo 
  echo "SSH server parameters ($SSHD_FILE):"
  echo "ListenAddress ${SSHD_LISTEN_ADDRESS}"
  echo "Port ${SSHD_PORT}"
  echo "UsePrivilegeSeparation no"
  echo "PasswordAuthentication yes"
  ```

  Speichern, dann:

  ```
  bash wsl_init.sh
  ```

  cmake prüfen:

  ```
  $ which cmake
  /usr/bin/cmake
  ```

- update und SSH installieren

  ```
  sudo apt-get update
  sudo apt-get install cmake gcc clang gdb build-essential
  wget https://raw.githubusercontent.com/JetBrains/clion-wsl/master/ubuntu_setup_env.sh && bash ubuntu_setup_env.sh
  ```

## CLion Config

- CLion (Installieren + ) Starten
  im Startmenü auf Configure->Edit Custom Properties...
  damit wird die Datei "C:\Users\roman\AppData\Roaming\JetBrains\CLion2020.2\idea.properties" editiert. Dort am Ende einfügen (Linux ist Case-Sensitiv):

  ```
  idea.case.sensitive.fs=true
  ```

  CLion neu Starten.

- Neues Projekt (WSL)

  - File -> Settings...->Build, Exec...->Toolchains->+ (add Toolchain)
  - Environment *WSL*
  - Credentials: *localhost*/*port:2222*/*ubuuser*/*comein* -> OK
    muss auf *connected* schalten -> Settings beenden (OK)

- Projekt Kompilieren, im CMake-Tab sollte CMAKE von */usr/bin/cmake* kommen. Eventuell ist es notwendig die konfigurierte Toolchain an erster Stelle zu plazieren, sonst klappts nicht immer.

- Das Projekt wurde jetzt mittels Linux-Toolchain kompiliert und läuft daher nur dort ... (/mnt/c/temp/WSLN/cmake-build-debug$ ./WSL)

https://www.jetbrains.com/clion/features/dynamic-analysis.html

https://www.youtube.com/watch?v=xnwoCuHeHuY

https://docs.microsoft.com/de-de/windows/wsl/install-win10

## Valgrind on WSL

https://www.jetbrains.com/help/clion/memory-profiling-with-valgrind.html#start

- Installation von valgrind in der WSL:

  ```
  sudo apt-get install valgrind
  ```

  Prüfen:

  ```
  $ which valgrind
  /usr/bin/valgrind
  ```

- Konfigurieren:

  - File -> Settings...->Build, Exec...->Dynamic Analysis Tools->Valgrind
    dort Valgrind executable:

    ``` 
    /usr/bin/valgrind
    ```

- Testen:

  ```c++
  int main() {
      int *ptr = new int;
      std::cout << "Hello, WSL!" << std::endl;
      delete ptr;
      return 0;
  }
  ```

  hier wird dynamisch Speicherplatz reserviert. Bevor das Programm beendet wird, wird dieser Speicher auch wieder freigegeben. Wenn die *delete*-Zeile auskommentiert wird, dann wird, wenn mit Valgrind gestartet wird, ausgegeben:

  ![valgrind](bilder/CLionWslValgrind.png)

wobei mit der Auswahl der Elemente, die betroffene Stelle im Code angezeigt wird.