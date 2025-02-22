---
tags: 
aliases: 
created: 22. Februar 2025
draft: false
---

# Kubernetes

Kubernetes ist ein **Container Orchestration** Tool. -> Load Balancing von Microservices auf verschiedene Container

> [!question] Kubernetes Sorgt für
> 
> **Availability - Verfügbarkeit:** Keine Downtime von Systemen
> 
> **Scalability - Skalierbarkeit:** Bei höherer Load können neue Cluster einfach integriert werden  
>
> **Recovery:** Backups

![1200](../../assets/Excalidraw/Kubernetes%202025-02-22%2017.23.56.excalidraw)


## Nodes 

**Nodes** sind entweder virtuelle oder Physische maschinen mit einem Betriebssystem

> [!example] **Z.B.** Raspberry Pi, Alter Laptop/Tower, VM 


### Master Node

Host Computer mit 3 Wichtigen Containern:
- **API-Server**: Entrypoint zum Cluster. Schnittstelle um mit dem Cluster zu Interagieren
- **Controller Manager**: Verfolgt was in dem Cluster Passiert
- **Scheduler**: Für die Platzierung von **Pods** verantwortlich. Teilt die Auslastung gleichmäßig auf den Cluster Auf

ETCD: Datenbank
- Snapshots des Clusters -> Recovery
- Key-Value Storage.
- Beinhaltet Cluster Konfiguration

### Worker Nodes

## Virtual Network

Verbindet d

---

## Saves

Homelab mit Kubernetes

- [This homelab setup is my favorite one yet. - YouTube](https://www.youtube.com/watch?v=2yplBzPCghA)