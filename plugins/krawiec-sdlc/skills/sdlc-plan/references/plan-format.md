# Format planu i kontrola

## Pliki (szablony: `../../sdlc-standards/templates/vibe-plan/`)
- `overview.md` — cel, zakres, poza zakresem, założenia, umiejscowienie (tylko complex), ryzyka.
- `design.md` — tylko sekcje, których zmiana dotyczy: model domenowy, dane, konfiguracja, integracje, API. Brak zmian = brak sekcji.
- `tests.md` — podejście i tabela scenariuszy `tc-N` (nowe numery wg `docs/scenarios/`).
- `steps.md` — PR-y, kroki, zależności i równoległość, dokumentacja do aktualizacji.

Zestaw zależy od złożoności (`../SKILL.md`). Pisz zwięźle: tabele i listy, bez powtarzania ticketu.

## Kroki i PR-y
- Dziel na małe PR-y wdrażalne osobno. Granica tam, gdzie zmiana może trafić na produkcję sama: kontrakt zgodny wstecz najpierw, nowa funkcja za flagą, migracja przed kodem.
- Każdy krok jest budowalny i testowalny niezależnie, ma pole „Plan” wskazujące sekcję `design.md` lub `tests.md` (implementacja czyta tylko to) i jest oznaczony jako niezależny albo zależny od numerowanych kroków.
- Kroki niezależne oznacz do równoległej realizacji; kroki wymagające uzgodnienia z innym zespołem — jako moment ręcznej akceptacji.

## Kontrola przed oddaniem planu
Przejrzyj plan raz, w tej samej odpowiedzi; trywialne braki popraw bez raportowania, a zgłoś tylko realne problemy (format: `../../sdlc-standards/references/review-report-format.md`). Sprawdź:
- kryteria akceptacji z ticketu pokrywają kroki, a każdy scenariusz `tc-N` ma krok lub test (także ścieżki negatywne),
- kolejność ma sens (migracja przed kodem, interfejs przed implementacją, kontrakt przed konsumentem), brak cykli w zależnościach,
- zmiany kontraktów zgodne z ticketem wg „Zmiany kontraktów” w `../../sdlc-standards/references/workflow.md`,
- plan nie buduje tego, co robi inny serwis; użyte endpointy i zdarzenia istnieją,
- tam, gdzie krok ma `nfr-impact`: autoryzacja, sekrety, timeouty i retry integracji, paginacja, dane osobowe, rollback migracji, idempotentność konsumentów.

Po akceptacji poprawek zapisz plik(i) i zacommituj wg `sdlc-standards`.
