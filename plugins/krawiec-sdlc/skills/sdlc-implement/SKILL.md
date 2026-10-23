---
name: sdlc-implement
description: Implementacja zaakceptowanego planu z /.vibe/plan/<TICKET>/ krok po kroku — kod, testy, aktualizacja /.vibe, build, commit. Użyj, gdy prosisz o zaimplementowanie planu, etapu lub kroku.
---

# Implementacja

Najpierw sprawdź, czy nie ma skilla wyspecjalizowanego w tym zadaniu (`sdlc-standards/references/workflow.md` → „Wybór skilla”); jeśli jest, użyj go.

## Kontekst (czytaj tylko to, co krok wymaga)
- `steps.md` planu i **tylko** sekcje wskazane w polu „Plan” bieżącego kroku (brak pola — `overview.md` i sekcje `design.md` z obszaru kroku),
- kod objęty krokiem; `/.vibe/` w częściach dotykających kroku,
- `../sdlc-standards/references/code-standards.md`; `nfr.md` tylko przy `nfr-impact: tak`; skill `org-standards` (jeśli jest) — tematy pasujące do kroku.

Nie wskazano kroku — weź pierwszy niezrealizowany wg `steps.md` i `git log`.

## PR-y i równoległość
Realizuj w granicach PR-ów z `steps.md`. Gdy plan ma kroki niezależne, zapytaj raz przed startem, czy je zrównoleglić: główny tor idzie łańcuchem zależności, niezależne kroki robią podagenci (w Claude Code każdy w osobnym git worktree), każdy jako osobny PR lub scalany do gałęzi głównego toru. Bez podagentów — po kolei, z zachowaniem granic PR-ów.

## Czego nie robić
Nic poza planem — także refaktoringu, zmiany logiki biznesowej ani usuwania funkcji — bez uzgodnienia. Nowe zależności tylko z uzasadnieniem w planie.

## Krok
1. **Zakres:** odczytaj „Plan” kroku, potwierdź zgodność zakresu i spełnienie zależności. Rozbieżność — zatrzymaj się i pokaż ją człowiekowi.
2. **Kod:** implementacja, migracje, konfiguracja wg kroku.
3. **Testy** razem z kodem, nie po etapie — `references/testing.md`. Nowe i zmienione scenariusze `tc-N` dopisz do `docs/scenarios/<obszar>.md` (`../sdlc-standards/templates/docs/scenarios.md`).
4. **`/.vibe`:** zaktualizuj wg `../sdlc-standards/templates/vibe/README.md`, jeśli krok zmienia mapę lub reguły. Jeśli krok zmienia kontrakty lub opis serwisu, a repo ma plik katalogu usług — zaktualizuj go w tym PR. `/docs` zostaje do `sdlc-docs`.
5. **Weryfikacja:** build i testy wg `sdlc-standards` oraz komendy z planu; dalej tylko przy zielonym. Brak automatycznej weryfikacji — poproś o ręczną akceptację.
6. **Commit** wg `sdlc-standards`.
