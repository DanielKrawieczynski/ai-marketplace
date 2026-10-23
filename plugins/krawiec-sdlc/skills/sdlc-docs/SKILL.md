---
name: sdlc-docs
description: Aktualizacja i weryfikacja dokumentacji (/docs, /.vibe) względem kodu. Tryby zmiany, aktualizuj, weryfikuj. Użyj po zmianach w kodzie, przed PR albo przy audycie dokumentacji.
---

# Dokumentacja

## Tryby
- **zmiany** *(domyślny)* — na podstawie `git diff` gałęzi, po zmianach w kodzie i przed PR,
- **aktualizuj** — pełna aktualizacja z całego kodu i planu (rzadko, np. po długim okresie bez zmian),
- **weryfikuj** — sprawdź spójność z kodem, niczego nie zmieniaj.

Nie podano trybu — zaproponuj jeden.

## Zasady
- Aktualizuj tylko to, co wymaga zmiany; nie usuwaj prawdziwych treści; zachowaj strukturę; nie zmieniaj treści biznesowych ani PRD bez wyraźnej potrzeby.
- Źródłem jest kod: konfiguracja (`05`) z plików konfiguracji i klas opcji, baza (`04`) z migracji.
- `docs/scenarios/` aktualne względem zachowania (`../sdlc-standards/templates/docs/scenarios.md`). Z `/.vibe` usuń przepisane listy endpointów, pól i kolumn.
- Szablony: `../sdlc-standards/templates/docs/` i `templates/vibe/` (zasady — `vibe/README.md`). Commit wg `sdlc-standards`.

## Kontekst
`steps.md` planu (jeśli praca z planem), odpowiednie `/.vibe/*` i `/docs/*`; dla trybu `zmiany` samodzielnie `git diff <baza>...HEAD` (`--stat` najpierw). Czytaj tylko pliki dokumentacji, których dotyczy diff.

## Tryb zmiany
Tylko diff, nie całe repo:
1. ustal, co się zmieniło,
2. zaktualizuj `/docs/*` dla ludzi: logikę, kontrakty, przepływy, reguły (nie opisuj kodu),
3. zaktualizuj `/.vibe/*` (zwykle zrobiła to już implementacja),
4. istotna decyzja architektoniczna — ADR wg `sdlc-adr`,
5. zmiana kontraktów lub zależności rozjeżdża się z katalogiem usług (jeśli organizacja go prowadzi) — wypisz,
6. zmiana wpływa na inne repozytoria — zaznacz wyraźnie.

Wyjście: co się zmieniło · pliki do aktualizacji · zaktualizowane sekcje · rozbieżności z katalogiem · wpis ADR (jeśli był).

## Tryb aktualizuj
Zaktualizuj `/docs/*` i `/.vibe/*` z całego kodu i planu, w zakresie z „Postępowanie” w `sdlc-standards`.

## Tryb weryfikuj
Sprawdź spójność z kodem (i katalogiem usług, jeśli jest), kompletność, aktualność i zgodność z `templates/vibe/README.md`: opis serwisu, kontrakty API i zdarzeń, zależności; `/docs/*` — kompletność, spójność, ADR; `/.vibe/*` — API, konsumenci, baza, konfiguracja, wdrożenie, model, linki do kodu. Opcjonalnie Confluence (`atlassian`): strony o serwisie (CQL po nazwie) i ich rozbieżności z kodem; edycja stron tylko po potwierdzeniu.

Niczego nie poprawiaj samodzielnie — najpierw raport wg `../sdlc-standards/references/review-report-format.md` z sekcjami „Niespójności z kodem” i (przy katalogu) „Niespójności z katalogiem”. Po akceptacji zastosuj zmiany.
