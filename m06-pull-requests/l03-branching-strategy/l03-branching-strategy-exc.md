# Lab 6.3 - Übung: Branch-, Remote- und Tagging-Strategie festlegen

Diese Übung erzeugt ein Dokument im Referenzprojekt, keine Code-Änderung an der Site selbst.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Lab 6.2, mit bisheriger Erfahrung aus den Modulen 4-6 (Branch-Namen, Merge-Strategien, ein Tag).

## Aufgaben

1. Die bisher im Referenzprojekt tatsächlich verwendeten Branch-Namen aus den Modulen 4-6 mit `git log --all --oneline --graph` oder `git branch -a` (falls noch vorhanden) sichten und auflisten.
2. Eine Branch-Namenskonvention mit mindestens zwei Präfixen festlegen (z. B. `feature/`, `fix/`) inklusive je einem Beispiel.
3. Eine Standard-Merge-Strategie für Pull Requests festlegen und in 1-2 Sätzen begründen, warum sie zum bisherigen Team-Umfang passt.
4. Eine Tagging-Regel festlegen (z. B. "ein Tag nach jedem abgeschlossenen thematischen Block") und mit dem bereits gesetzten Tag `v0.1` abgleichen.
5. Eine Ausnahmefall-Regelung ergänzen (z. B. Vorgehen bei einer dringenden Korrektur außerhalb des normalen Branch-Schemas).
6. Alle Festlegungen in einer neuen Datei `STRATEGY.md` im Wurzelverzeichnis des Repositorys dokumentieren.
7. `STRATEGY.md` committen.

## Beobachtbarer Checkpoint

`STRATEGY.md` existiert, ist committet und enthält alle vier verlangten Bausteine (Branch-Namen, Merge-Strategie, Tagging, Ausnahmefall).

## Abschlusskriterien

- Jeder Baustein enthält mindestens ein konkretes Beispiel, keine reine Absichtserklärung.
- Die Merge-Strategie-Begründung bezieht sich auf den tatsächlichen bisherigen Kursverlauf, nicht auf eine allgemeine Empfehlung.
- Die Datei ist Teil der committeten Historie, nicht nur lokal vorhanden.

## Erweiterung (optional)

Eine kurze Regel ergänzen, wie mit Branches umgegangen wird, die länger als eine Woche offen bleiben, ohne gemergt zu werden.

## Fallback

Bei Unsicherheit über konkrete Beispiele aus den Modulen 4-6: die in den jeweiligen Lab-Anleitungen bereits verwendeten Branch-Namen (`feature/nav-highlight`, `feature/footer-tweak`, `feature/portal-title`, `feature/social-links`, `feature/team-photo-note`) als Ausgangspunkt für Aufgabe 1 verwenden.
