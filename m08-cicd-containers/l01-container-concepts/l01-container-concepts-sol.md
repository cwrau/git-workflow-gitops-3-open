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

Zuordnung: `docker pull` lädt aus der Registry, `docker images` listet das Image (die lokale Vorlage), `docker run` startet daraus einen Container, `docker ps -a` zeigt den beendeten Container mit Status "Exited".

## Erweiterung (Beispielantwort)

```bash
docker run alpine:3.22 echo "Zweiter Lauf"
docker ps -a
```

`docker ps -a` zeigt danach zwei Einträge mit unterschiedlicher Container-ID, aber identischer `IMAGE`-Spalte (`alpine`) - ein Image kann beliebig oft als Grundlage für unabhängige Container dienen.

## Einordnung für Modul 9

Die hier verwendeten Einzelbefehle starten jeweils genau einen Container manuell. Kubernetes (Modul 9) verwaltet stattdessen viele Container automatisiert über deklarative Regeln - der Unterschied zwischen manuellem `docker run` und automatisierter Orchestrierung wird dort vertieft.
