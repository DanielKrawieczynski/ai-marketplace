# Funkcja i greenfield

Wykonaj kroki F1–F4, potem `plan-format.md`. Greenfield obejmuje cały projekt od zera: dopytaj zbiorczo, czy ma to być jeden serwis czy kilka, nowe repozytorium czy moduł w istniejącym, jakie typy projektów są potrzebne na start (API, konsument, baza, testy).

## F1. PRD
Wygeneruj lub zaktualizuj `/.vibe/01-prd.md` (szablon: `../../sdlc-standards/templates/vibe/01-prd.md`). Bez modelu domenowego (to F2), neutralnie technologicznie, ale ze stosem przyjętym w istniejących serwisach użytkownika; odstępstwa uzasadnij. Zawiera część biznesową i techniczną, bez implementacji. Commit wg `sdlc-standards`.

## F2. Model domenowy (opcjonalny)
Gdy PRD opisuje nową domenę lub istotne zmiany w istniejącej: `/.vibe/07-domain-model.md`. Najpierw zbiorczo zapytaj o: granice kontekstu (co jest własne, co referencją zewnętrzną), niezmienniki agregatów, zdarzenia domenowe, istniejący model w kodzie (jeśli jest — rozszerz). Poczekaj na odpowiedzi. Konsumentów zdarzeń ustal wg `placement.md` (K4).

## F3. Nowy serwis czy istniejący?
Na podstawie PRD i `placement.md` (K1–K5):
- **Pasuje do istniejącego**, jeśli ma pasujące odpowiedzialności i domenę, a jego `out of scope` tego nie wyklucza; istniejące API i zdarzenia można wykorzystać zamiast budować od nowa.
- **Nowy serwis**, gdy inna domena, inny cykl wdrożeń, niezależne skalowanie lub inna technologia. Przeciw: duplikacja logiki, rozproszenie bez zysku, niska spójność z resztą nowego serwisu.
- **Podział:** F4 dla nowej części, zwykły plan dla zmian w istniejącym.

Rekomendację przedstaw z uzasadnieniem. Decyzja niestandardowa (np. nowa technologia) — najpierw `sdlc-adr`.

## F4. Nowy serwis
Sprawdź, czy użytkownik ma szablon, generator lub skill do zakładania serwisów. Jeśli ma — użyj go zamiast tworzyć repo, projekty, Dockerfile i konfigurację ręcznie; parametry czytaj z jego dokumentacji, nie wymyślaj.
1. Potwierdź dane z PRD: nazwa, stos, typy projektów, hosting, API / zdarzenia / baza.
2. Repozytorium: wskaż użytkownikowi, jak je utworzyć, i poczekaj na adres. Nie zakładaj go samodzielnie.
3. Projekty: bez generatora zaproponuj strukturę na wzór istniejących serwisów użytkownika (`workflow.md` → „Inne repozytoria”) i wykonaj po akceptacji.
4. Wpis w katalogu usług, jeśli organizacja go prowadzi: wskaż, jak go dodać, i uzupełnij plik opisu w repo danymi z PRD.
5. Szkielety dokumentacji z szablonów (to, co wiadomo z PRD, reszta `TODO`): `/.vibe/` wg `templates/vibe/README.md` i `/docs/` bez `scenarios.md`.

Commit wg `sdlc-standards`.
