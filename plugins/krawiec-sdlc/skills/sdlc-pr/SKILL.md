---
name: sdlc-pr
description: Wystawienie Pull Requesta — sprawdzenie warunków, push, opis z planu i review przez gh, powiązanie z Jirą. Użyj, gdy prosisz o utworzenie lub wystawienie PR.
---

# Pull Request

Merge nie należy do tego skilla — scala człowiek (lub auto-merge po wymaganych checkach i approve).

## Kontekst (równolegle)
`git status`, `git log <baza>..HEAD`, `git diff <baza>...HEAD --stat` (baza: gałąź poprzedniego PR, gdy gałęzie są budowane jedna na drugiej, inaczej `main` / `master` wg `origin/HEAD`); `overview.md` i `steps.md` planu; ostatni raport `sdlc-review` z rozmowy; ticket z Jiry (tytuł, kryteria); `.github/pull_request_template.md`, jeśli jest.

## 1. Warunki
Sprawdź i wypisz wynik każdego punktu:
- jesteś na gałęzi z ticketem, nie na bazowej,
- brak niezacommitowanych zmian (poza tym, czego repo nie commituje) — jeśli są, zapytaj o commit (format wg `sdlc-standards`),
- build i testy zielone (wg „Weryfikacja”),
- brak nowych issues analizy statycznej o wysokiej wadze (jeśli jest narzędzie); wynik review dla tego samego HEAD wystarczy,
- `sdlc-review` nie zostawiło otwartych problemów krytycznych,
- `/docs` zaktualizowane (`sdlc-docs`, tryb `zmiany`), jeśli zmiana tego wymaga.

Warunek niespełniony — zatrzymaj się i pokaż, czego brakuje.

## 2. Opis
Tytuł: `<TICKET> <tytuł ticketu lub krótki opis>`; przy kilku PR-ach do ticketu `<TICKET> (n/m) <opis>`. Treść po polsku, wg szablonu repo, jeśli jest:
- **Ticket** — link,
- **Co i dlaczego** — 2–5 zdań z `overview.md`,
- **Zakres** — kroki tego PR z `steps.md`: zrobione / pominięte (z powodem),
- **Kontrakty i migracje** — zmiany API, zdarzeń, schematu; breaking czy nie, a przy breaking: czy zapowiedź z ticketu wysłano lub jest do wysłania,
- **Testy** — co dodano, wynik,
- **Review** — podsumowanie raportu, znane ryzyka, otwarte kwestie,
- **Do ręcznej weryfikacji** — oraz „Zestawienie” NFR (`../sdlc-standards/references/nfr.md`), jeśli zmiana go dotyczy.

## 3. Utworzenie
1. Pokaż tytuł i treść, poproś o potwierdzenie (push i PR są widoczne dla innych).
2. `git push -u origin <gałąź>`.
3. `gh pr create --base <baza> --title "<tytuł>" --body-file <plik poza repo>`; domyślnie `--draft`, chyba że prosisz o gotowy.
4. Podaj link.

## 4. Jira (opcjonalnie)
Zaproponuj komentarz z linkiem do PR; dodaj dopiero po potwierdzeniu.
