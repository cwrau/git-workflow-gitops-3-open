# Lab 4.1 - Übung: Branches erstellen, wechseln und vergleichen

Diese Übung arbeitet im `teamsite`-Repository (Stand nach Tag 1: `output/project/checkpoints/after-day1/`).

## Ausgangslage

Das `teamsite`-Repository mit sauberem Arbeitsverzeichnis auf `main`.

## Aufgaben

1. Zwei neue Branches anlegen: `feature/nav-highlight` und `feature/footer-tweak`, beide ausgehend von `main`.
2. Mit `git branch -v` bestätigen, dass beide Branches auf denselben Commit wie `main` zeigen.
3. Auf `feature/nav-highlight` wechseln, dann auf `feature/footer-tweak`, dann zurück auf `main` - nach jedem Wechsel mit `git branch` (aktueller Branch markiert mit `*`) den aktuellen Stand bestätigen.
4. Mit `git log --oneline --graph --all` alle Branches gemeinsam visualisieren.
5. In 2-3 Sätzen beschreiben, warum die Grafik aus Aufgabe 4 aktuell keine Verzweigung zeigt, obwohl drei Branches existieren.

## Beobachtbarer Checkpoint

`git branch` listet drei Branches (`main`, `feature/nav-highlight`, `feature/footer-tweak`); `git log --graph --all` zeigt alle drei Branch-Namen am selben Commit.

## Abschlusskriterien

- Beide neuen Branches existieren und zeigen auf denselben Commit wie `main`.
- Der aktuelle Branch wurde nach jedem Wechsel korrekt identifiziert.
- Die Erklärung in Aufgabe 5 nennt den Grund (noch keine eigenen Commits je Branch), nicht nur das Symptom.

## Erweiterung (optional)

Einen vierten Branch mit `git switch -c feature/social-links` in einem Schritt anlegen und wechseln, statt `git branch` und `git switch` getrennt aufzurufen.

## Fallback

Ohne eigenen Zugriff auf den Tag-1-Stand: mit einem frisch initialisierten Repository und einem einzigen Startcommit (beliebiger Platzhalterinhalt) arbeiten - die Branch-Mechanik ist unabhängig vom konkreten Dateiinhalt identisch.
