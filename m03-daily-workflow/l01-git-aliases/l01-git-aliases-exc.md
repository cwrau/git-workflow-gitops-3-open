# Lab 3.1 - Übung: Aliases für den täglichen Git-Workflow

Diese Übung verändert die persönliche Git-Konfiguration, nicht das Referenzprojekt.

## Ausgangslage

Ein konfiguriertes Git (aus Modul 1) ohne bisher definierte Aliase.

## Aufgaben

1. Drei eigene Aliase anlegen: einen für `status`, einen für `log --oneline --graph --decorate`, einen für einen selbst gewählten dritten Befehl (z. B. `branch`, `diff` oder `checkout`).
2. Jeden Alias mindestens einmal im `teamsite`-Repository ausführen und die Ausgabe mit dem vollständigen Befehl vergleichen.
3. Mit `git config --global --get-regexp alias` alle drei definierten Aliase in einer Ausgabe anzeigen.
4. Eine kurze Tabelle erstellen: Alias-Name, ausgeführter Befehl, kurze Begründung, warum genau dieser Befehl einen Alias lohnt.

## Beobachtbares Ergebnis

Drei funktionierende, getestete Aliase sowie eine ausgefüllte Begründungstabelle.

## Abschlusskriterien

- Alle drei Aliase liefern beim Ausführen dieselbe Ausgabe wie ihr vollständiger Befehl.
- `git config --global --get-regexp alias` zeigt alle drei Einträge.
- Die Begründung nennt einen konkreten Alltagsgrund, keine allgemeine Floskel.

## Erweiterung (optional)

Einen Alias definieren, der zwei Befehle kombiniert (z. B. `git config --global alias.up "!git add -A && git commit"` - erfordert ein vorangestelltes Ausrufezeichen für Shell-Befehle) und dessen Einschränkungen (z. B. feste Commit-Nachricht fehlt) notieren.
