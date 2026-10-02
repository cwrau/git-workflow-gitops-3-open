# Lab 6b.1 - Lösung: Rebase und sicheres Pushen

## Aufgabe 1-2: Vorbereitung und Ausgangslage

```bash
cd ~/teamsite
bash ~/handout/project/setup/snippets/rebase-vorbereiten.sh
git log --oneline --graph --all
```

Der Graph zeigt `main` mit "feat: Neuigkeit ergänzen" und daneben die drei Commits des Feature-Branches, die vom alten Stand abzweigen.

## Aufgabe 3: Auf main aufsetzen

```bash
git rebase main
git log --oneline --graph --all
```

Die drei Commits liegen jetzt über dem Neuigkeits-Commit. Ihre Hashes haben sich geändert.

## Aufgabe 4: Commits zusammenfassen

```bash
git rebase -i HEAD~3
```

Liste im Editor, von alt nach neu:

```text
pick   <hash> feat: Notizen ergänzen
fixup  <hash> wip: Notiz 2
fixup  <hash> wip: Notiz 3
```

Danach bleibt ein Commit "feat: Notizen ergänzen" mit dem Inhalt aller drei.

## Aufgabe 5: Pushen

```bash
git push
```

Ausgabe: `! [rejected] feature/notizen -> feature/notizen (non-fast-forward)`, weil der Remote noch die alten Commits hat.

```bash
git push --force-with-lease
```

Der Push gelingt als "forced update", weil auf dem Remote nichts Neues lag.

## Aufgabe 6: Zurück auf main

```bash
git switch main
```

## Erweiterung (Beispielantwort)

Bei einem Konflikt hält Git den Rebase an. Die Datei wird bereinigt, dann:

```bash
git add notizen.md
git rebase --continue
```

Mit `git rebase --abort` lässt sich der Rebase komplett zurücknehmen.
