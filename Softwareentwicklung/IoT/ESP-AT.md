---
tags: []
aliases: []
created: 7. Januar 2024
---

# ESP-AT

## ESP-AT Flash

Um den [ESP32](../../../Digitaltechnik/ESP32.md) programmieren zu können, muss zuerst die Firmware (ESP-AT) auf den Chip heruntergeladen werden. Dafür kommt das ESP Flash Download Tool von Espressif zum Einsatz. Dieses Tool wir dafür benötigt, die Binary-Files der Firmware über USB auf den [SPI](../../../Digitaltechnik/Interfaces/SPI.md)-Flash zu spielen. Im Nächsten muss zuerst das Tool heruntergeladen, entpackt und die .exe ausgeführt werden.

![](../../_assets/Flash_DL_Tools.png)

Mit den gezeigten Einstellungen, kann nun das Aufsetzen der Firmware fortgesetzt werden

![](../../_assets/FlashDL-Folder.png)

Natürlich werden auch die ESP-AT Binaries selbst benötigt, welche man in den SDK-Downloads auf der Espressif Website findet.  
Von dem entsprechenden Modul (hier der [ESP32](../../../Digitaltechnik/ESP32.md)-WROOM) muss nun die empfohlene Version der Firmware heruntergeladen werden.  
ESP-AT beinhaltet die Binärdateien der Partitions-Tabelle, des Bootloaders, sowie Encryption-Keys und Certificate-Authorities (CA) von Netzwerkprotokollen wie [MQTT](MQTT.md).

![](../../_assets/ESPATbins.png)

Hat man den Firmware Folder entpackt, befindet sich in dem Ordner ein `flasher_args.json` File, in welchem man die Pfade zu den Binärdateien findet, sowie den Offset, welcher bestimmt an welcher Stelle im [SPI](../../../Digitaltechnik/Interfaces/SPI.md)-Flash die Binary installiert werden soll.

```json
"flash_files" : {
    "0x8000" : "partition_table/partition-table.bin",
    "0x10000" : "ota_data_initial.bin",
    "0xf000" : "phy_multiple_init_data.bin",
    "0x1000" : "bootloader/bootloader.bin",
    "0x100000" : "esp-at.bin",
    "0x20000" : "at_customize.bin",
    "0x24000" : "customized_partitions/server_cert.bin",
    "0x39000" : "customized_partitions/mqtt_key.bin",
    "0x26000" : "customized_partitions/server_key.bin",
    "0x28000" : "customized_partitions/server_ca.bin",
    "0x2e000" : "customized_partitions/client_ca.bin",
    "0x30000" : "customized_partitions/factory_param.bin",
    "0x21000" : "customized_partitions/ble_data.bin",
    "0x3B000" : "customized_partitions/mqtt_ca.bin",
    "0x37000" : "customized_partitions/mqtt_cert.bin",
    "0x2a000" : "customized_partitions/client_cert.bin",
    "0x2c000" : "customized_partitions/client_key.bin"
},
```

> [!INFO] Den Flasher-Arguments entsprechend, müssen die Pfade sowie deren Offset in das Flash-Download-Tool eingetragen werden.  
> ![](../../_assets/Pasted%20image%2020230818003454.png)

> [!INFO] Auch die [SPI](../../../Digitaltechnik/Interfaces/SPI.md) Flash Konfigurationen werden aus den Flasher Arguments entsprechend übernommen:
>
> ```json
>"flash_settings" : {
>	"flash_mode": "dio",
>	"flash_size": "detect",
>	"flash_freq": "40m"
>},
>```
>
>![](../../_assets/Pasted%20image%2020230818003644.png)

> [!INFO] Nun muss nur noch der richtige COM-Port selektiert werden und „Start“ ausgeführt werden.  
> ![](../../_assets/Pasted%20image%2020230818003709.png)

> [!success] Der Bootloader sollte nun erfolgreich auf den [ESP32](../../../Digitaltechnik/ESP32.md) gebrannt worden sein