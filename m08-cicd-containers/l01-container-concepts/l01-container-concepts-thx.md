---
theme: default
layout: default
---

# Lab 8.1: Docker-Grundbegriffe anhand ausgeführter Befehle zuordnen

Grundlegende Docker-Befehle ausführen und die beobachtete Ausgabe den passenden Begriffen (Image, Container, Registry) zuordnen, bevor Modul 8 mit GitHub Actions containerisierte Schritte nutzt.

**Leitfragen:**

<details>
<summary>Was ist der Unterschied zwischen einem Image und einem Container?</summary>

Ein Image ist eine unveränderliche Vorlage (Dateisystem plus Startbefehl); ein Container ist eine laufende (oder beendete) Instanz eines Images.

</details>

<details>
<summary>Woher lädt `docker pull` ein Image, wenn kein Pfad angegeben wird?</summary>

Von Docker Hub, der Standard-Registry, sofern keine andere Registry explizit angegeben ist.

</details>

<details>
<summary>Was zeigt `docker ps -a` im Vergleich zu `docker ps`?</summary>

`docker ps` zeigt nur laufende Container, `docker ps -a` zusätzlich bereits beendete.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Image | unveränderliche Vorlage für einen Container (Dateisystem + Startbefehl) |
| Container | laufende oder beendete Instanz eines Images |
| Registry | Speicherort für Images (Standard: Docker Hub) |
| Orchestrierung | automatisiertes Verwalten mehrerer Container über Regeln statt Einzelbefehle (Kubernetes, Thema Modul 9) |

## Docker-Grundbefehle

| Befehl | Wirkung |
| --- | --- |
| `docker pull <image>` | lädt ein Image aus der Registry herunter |
| `docker images` | listet lokal vorhandene Images |
| `docker run <image> <befehl>` | startet einen neuen Container aus einem Image |
| `docker ps -a` | listet alle Container, auch beendete |

## Ablauf für dieses Lab

```bash
docker --version
docker pull alpine:3.22
docker images
docker run alpine:3.22 echo "Hallo aus dem Container"
docker ps -a
```

- Nach `docker run ... echo ...` beendet sich der Container sofort wieder, da der Startbefehl abgeschlossen ist - er bleibt aber in `docker ps -a` als beendeter Container sichtbar.
- Ein bereits lokal vorhandenes Image wird bei erneutem `docker pull` nicht erneut vollständig heruntergeladen, sofern es unverändert ist.

> **Merksatz:** Ein Image beschreibt "was gestartet werden kann", ein Container "was gerade läuft oder gelaufen ist".

## Fazit

- Ein Image ist die Vorlage, ein Container die daraus gestartete Instanz.
- `docker pull` bezieht Images aus einer Registry, standardmäßig Docker Hub.
- Orchestrierung (Kubernetes) verwaltet viele Container automatisiert - das ist Thema von Modul 9, nicht dieses Labs.

Die Übung führt vier grundlegende Docker-Befehle aus und ordnet die beobachtete Ausgabe den passenden Begriffen zu.
