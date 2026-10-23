---
name: sdlc-init
description: Jednorazowy onboarding repozytorium do pracy z AI — z kodu generuje /.vibe (mapa dla agentów) i /docs (dla ludzi). Użyj, gdy repo nie ma tej dokumentacji albo prosisz o init.
---

# Onboarding repozytorium

Wynik: `/.vibe/` (dla agentów) i `/docs/` (dla ludzi), zbudowane z kodu. Szablony: `../sdlc-standards/templates/vibe/` (pliki i warunki — `README.md`) oraz `../sdlc-standards/templates/docs/`. Użytkownik może ograniczyć zakres (np. „tylko .vibe”).

## Zasady
- Dokumentujesz to, co jest. Nie refaktoryzuj, nie projektuj nowego modelu, nie pisz implementacji.
- Bez wymyślonych elementów: czego nie wynika z kodu — `TODO` i pytanie na końcu.
- `.vibe` to mapa (gdzie szukać, reguły nieoczywiste), a nie kopia kodu; `docs` to narracja dla zespołu („dlaczego tak”).

## Kroki
1. **Rozpoznanie** (równolegle): pliki zależności i wersji, struktura projektów, `Dockerfile` i pliki CI / wdrożeniowe, konfiguracja, migracje, kontrakty API i zdarzeń, istniejące README i dokumentacja. Ustal: typy projektów, stos, styl API, hosting, integracje, przynależność do capabilities (udostępnia API, publikuje i konsumuje zdarzenia, używa bazy, ma zadania w tle), domenę i granice. Confluence (`atlassian`) tylko jako źródło kontekstu biznesowego dla PRD, zawsze zweryfikowane z kodem. Wynik pokaż krótko w rozmowie, bez osobnego pliku.
2. **`/.vibe/`**: pliki z szablonów, które wynikają z capabilities (tabela w `templates/vibe/README.md`).
3. **`/docs/`**: wszystkie szablony poza `scenarios.md` (wzór plików tworzonych później) i `troubleshooting.md` (tylko gdy kod daje podstawy). Diagramy w Mermaid. ADR wg `sdlc-adr`.
4. **Wynik**: zapisz pliki i zgłoś (a) niespójności wykryte w repo — kod vs kod, kod vs dokumentacja — z lokalizacją, naprawę zaproponuj jako osobne zadanie (`sdlc-plan`); (b) pytania o niejasności.
