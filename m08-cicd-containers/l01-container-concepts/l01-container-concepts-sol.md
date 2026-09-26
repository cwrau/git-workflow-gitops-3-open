# Lab 8.1 - Lösung: Docker-Grundbegriffe anhand ausgeführter Befehle zuordnen

## Aufgabe 1-5: Befehle und Beispielausgaben

```bash
docker --version
# Docker version 26.x.x, build ...

docker pull alpine:3.22
# 3.22: Pulling from library/alpine
# ... Layer-Downloads ...
# Status: Downloaded newer image for alpine:3.22

docker images
# REPOSITORY   TAG       IMAGE ID       SIZE
# alpine       3.22      <id>           ~7MB

docker run alpine:3.22 echo "Hallo aus dem Container"
# Hallo aus dem Container

docker ps -a
# CONTAINER ID   IMAGE          COMMAND               STATUS
# <id>           alpine:3.22    "echo 'Hallo ...'"    Exited (0) ...
```

## Aufgabe 6: Zuordnungstabelle

| Befehl | Beobachtete Ausgabe (zusammengefasst) | Zugeordneter Begriff |
| --- | --- | --- |
| `docker pull alpine:3.22` | lädt Layer aus einer entfernten Quelle herunter | Registry |
| `docker images` | listet `alpine` mit ID und Größe als lokale Vorlage | Image |
| `docker run alpine:3.22 echo ...` | gibt den Text einmalig aus, dann endet der Prozess | Container (während der Ausführung) |
| `docker ps -a` | zeigt den beendeten Lauf mit Status "Exited" | Container (nach der Ausführung) |

## Erweiterung (Beispielantwort)

```bash
docker run alpine:3.22 echo "Zweiter Lauf"
docker ps -a
```

`docker ps -a` zeigt danach zwei Einträge mit unterschiedlicher Container-ID, aber identischer `IMAGE`-Spalte (`alpine`) - ein Image kann beliebig oft als Grundlage für unabhängige Container dienen.

## Einordnung für Modul 9

Die hier verwendeten Einzelbefehle starten jeweils genau einen Container manuell. Kubernetes (Modul 9) verwaltet stattdessen viele Container automatisiert über deklarative Regeln - der Unterschied zwischen manuellem `docker run` und automatisierter Orchestrierung wird dort vertieft.
