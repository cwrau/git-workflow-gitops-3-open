# Kursüberblick: Git-Workflow und GitOps

## Kursziel und sichtbares Endergebnis

Am Ende des Kurses beherrschen die Teilnehmenden den vollständigen Git-Workflow von der lokalen Commit-Historie bis zu einer über GitOps automatisiert ausgerollten Änderung, angewendet auf ein gemeinsames Referenzprojekt: die **Kodschul Team Site**, eine kleine, anonymisierte statische Website (HTML/CSS/JavaScript).

Sichtbarer Abschluss (Modul 9, Lab 9.3): ein selbst durchgeführter End-to-End-Rollout - ein Git-Commit löst über Argo CD automatisch eine beobachtbare Änderung in einem lokalen Kubernetes-Cluster aus, ohne manuellen Bereitstellungsschritt.

## Zielgruppe und bestätigte Voraussetzungen

- **Rolle:** Softwareentwicklerinnen und Softwareentwickler.
- **Vorkenntnisse:** gemischt - von vollständigen Git-Einsteigern bis zu Teilnehmenden mit erster praktischer Git-Erfahrung. Allgemeine Programmiererfahrung wird vorausgesetzt, gesicherte Git-Kenntnisse nicht.
- **Durchführung:** online (Virtual Classroom), Sprache Deutsch, Gruppengröße ab 4 Teilnehmenden.
- **Baseline für alle:** jedes Modul ist mit einer Baseline-Aufgabe für Einsteiger lösbar; Teilnehmende mit Vorerfahrung erhalten zusätzliche, klar abgetrennte Erweiterungen (Schwerpunkt Tag 3).
- **Vorbereitung vor Kursbeginn:** Git installiert, GitHub-Konto vorhanden, Docker (bzw. alternative Container-Runtime) sowie ein lokales Einzelknoten-Kubernetes (kind oder Minikube) für Tag 3 lauffähig.

## Vollständige Agenda

### Tag 1 - Lokale Commit-Historie und täglicher Workflow (09:00-16:30)

| Zeit | Modul | Inhalt |
| --- | --- | --- |
| 09:00-09:55 | - | Trainer- und Teilnehmervorstellung, Kursüberblick |
| 09:55-12:15 | Modul 1: Versionskontrolle-Grundlagen und lokale Commits | Change Management, `git init`, erster Commit, Datei-Operationen |
| 13:15-14:45 | Modul 2: Commit-Historie prüfen und bereinigen | `git log`/`git show`, `commit --amend`, `reset`, Diagnose |
| 15:00-16:30 | Modul 3: Täglichen Workflow effizient gestalten | Aliases, `.gitignore`, `git stash` |

**Checkpoint:** Referenzprojekt mit sauberer, nachvollziehbarer Commit-Historie, Aliases, `.gitignore` und funktionierendem Stash-Workflow.

### Tag 2 - Branches, GitHub-Zusammenarbeit und Pull Requests (09:00-16:30)

| Zeit | Modul | Inhalt |
| --- | --- | --- |
| 09:00-11:30 | Modul 4: Branches und Merging beherrschen | Branches, Tags, konfliktfreies Mergen, Merge-Konflikt auflösen |
| 11:30-14:15 | Modul 5: Mit Remote-Repositories und GitHub zusammenarbeiten | Remote-Grundlagen, GitHub-Anbindung, Fork/Upstream |
| 14:15-16:30 | Modul 6: Pull Requests, Code Reviews und Verlaufsverwaltung | Pull Request, Review, Cherry-Picking/Squashing, Strategie-Dokument |

**Checkpoint:** abgeschlossener Pull-Request-Workflow mit Review und dokumentierter Branch-/Tagging-Strategie (`STRATEGY.md`).

### Tag 3 - Automatisierung, CI/CD und GitOps (09:00-16:30)

| Zeit | Modul | Inhalt |
| --- | --- | --- |
| 09:00-11:20 | Modul 7: Git-Automatisierung mit Hooks und Actions | Git-Hooks, Commit-Vorlage, erster GitHub-Actions-Workflow, GitHub Pages |
| 11:20-14:10 | Modul 8: Container-Grundlagen und CI/CD mit GitHub Actions | Docker-Grundbegriffe, Tests/Caching/Service-Container, branchabhängige Umgebungen |
| 14:10-16:30 | Modul 9: Infrastruktur als Code und GitOps in der Praxis | Deklarative Infrastruktur, Argo CD, Push- vs. Pull-Bereitstellung, End-to-End-Rollout |

**Checkpoint (Kursabschluss):** demonstrierter End-to-End-GitOps-Fluss, bei dem eine Änderung über einen Git-Commit automatisiert ausgerollt wird.

## Modul- und Projektstruktur

Jedes der neun Module besteht aus genau drei Labs (Theorie, Übung, Lösung):

```text
output/mXX-<modul>/
├── l01-<lab>/  (l01-<lab>-thx.md, -exc.md, -sol.md)
├── l02-<lab>/
└── l03-<lab>/
```

Das gemeinsame Referenzprojekt liegt in `output/project/`:

| Ordner | Inhalt |
| --- | --- |
| `starter/` | Ausgangsdateien für Modul 1 |
| `checkpoints/after-m1/`, `after-day1/`, `after-day2/`, `after-day3/` | Wiedereinstiegspunkte bei Rückstand |
| `gitops/` | Kubernetes-Manifeste und Argo-CD-Application für Modul 9 |

Nicht jedes Lab verändert das Referenzprojekt: kurze Übungen (z. B. Einordnungen, Diagnosen an einer präparierten Historie) erzeugen ein eigenständiges Ergebnis, ohne die gemeinsame Projektbasis zu verändern - das steht jeweils am Anfang der Übung.

## Arbeitsweise und Übungskonventionen

- Jedes Lab beginnt mit kurzer Theorie (`-thx.md`), gefolgt von einer Übung (`-exc.md`) und einer vollständigen Lösung (`-sol.md`).
- Übungen nennen Ausgangslage, nummerierte Aufgaben, einen beobachtbaren Checkpoint, Abschlusskriterien und - wo sinnvoll - eine optionale Erweiterung sowie einen Fallback für nicht funktionierende Umgebungen.
- Lösungen zeigen zu jeder Aufgabe einen vollständigen, nachvollziehbaren Lösungsweg inklusive erwarteter Befehlsausgaben.

## Umgebung und Sicherheit

- Alle Übungen laufen in Wegwerf-Repositories, einem lokalen Kubernetes-Cluster und einem harmlosen Demo-Container-Image - keine produktiven Systeme, keine echten Zugangsdaten oder Secrets.
- Fällt die lokale Kubernetes-/GitOps-Umgebung bei einzelnen Teilnehmenden aus, demonstriert der Trainer den betroffenen Ablauf live oder aufgezeichnet als vollwertigen Ersatz.
- GitHub-Authentifizierung (SSH-Schlüssel oder Personal Access Token) wird vor Kursbeginn eingerichtet, nicht während der Kurszeit.

## Teilnehmervorstellung

Zu Beginn von Tag 1 stellt sich jede Person kurz vor:

- Name und aktuelle Rolle,
- beruflicher Hintergrund und aktuelle Tätigkeit,
- Weg in das jetzige Fachgebiet,
- Organisation und Zeit dort,
- optional: Stadt/Region und, als lockerer Einstieg, das dortige Wetter,
- bisherige Erfahrung mit Git/GitHub/GitOps,
- Erwartungen an den Kurs,
- ein Projekt oder Anwendungsfall, auf den das Gelernte übertragen werden soll.

Persönliche Angaben (Stadt, Wetter, Organisation) können übersprungen werden.
