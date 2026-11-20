---
name: blind-plan
description: Plan zmiany z politykami technicznymi — zwykły sdlc-plan uzupełniony o pokrycie polityki technicznej, scenariusze techniczne, mapowanie do testów i evidence.md (TSP-07…09). Użyj po blind-ready, przy „zaplanuj z dowodami” lub jako krok blind-deliver.
---

# Plan z dowodami

Wynik: zwykły plan `krawiec-sdlc:sdlc-plan` w `/.vibe/plan/<TICKET>/` oraz to, co dokłada ten skill: pokrycie polityki technicznej, scenariusze techniczne (`docs/scenarios/technical-cases.md`), mapowanie do testów w `tests.md` i `evidence.md`. Zasady i formaty: `../blind-standards/SKILL.md`, `../blind-standards/references/scenarios-format.md`. Wymagań nie wymyślasz — pytasz. Ticket i commity wg `sdlc-standards`.

## Wejście
Zatwierdzone historyjki i scenariusze biznesowe (wynik `blind-ready`; bez zatwierdzenia — stop), `docs/scenarios/policies.md` i `technical-cases.md`, jeśli istnieją.

## Kroki
1. **Plan.** Uruchom `krawiec-sdlc:sdlc-plan` wg jego `SKILL.md` (tryb, kontekst, złożoność, plan). Jedno zbiorcze pytanie planu połącz z pytaniami z kroku 2.
2. **Pokrycie polityką.** Dla zakresu planu sprawdź, czy polityka techniczna rozstrzyga: niedostępność i timeout zależności, anulowanie, zamknięcie i restart procesu, duplikat, opóźnienie i kolejność zdarzeń, złe dane, wykrywanie awarii (sygnały, alerty, reakcja), przeszkody dla rollbacku — albo że nie dotyczą, z powodem. Luka: **zaproponuj politykę** (nagłówek „PROPOZYCJA — niezatwierdzone”), nie scenariusz biznesowy i nie zgadywaną regułę. Brak polityki w repo: zaproponuj pierwszą z tego, czego dotyczy zakres (kod, kontrakty), nie szablon na zapas. Reguła, której nie umiesz wywieść — **WYMAGA DECYZJI**.
3. **Scenariusze techniczne.** Z polityk i planu wygeneruj `technical-cases.md`: każdy scenariusz oznaczony polityką (P1…) albo `T`, jedna ścieżka = jeden scenariusz, kolejne `sc-X-Y` w obrębie historyjki. Nie pokazuj ich do przeglądu pojedynczo; podaj liczby i przypadki bez przypisania do polityki.
4. **Mapowanie do testów** w `tests.md` (rozszerza tabelę planu o kolumny **poziom testu** i **niezależny test**; bez `tests.md` zapisz poziom przy kroku w `steps.md`): scenariusze biznesowe wierszami, techniczne zbiorczo — polityka → scenariusze → poziom → krok/test. Każdy `sc-X-Y` ma krok i test, a kroki z logiką — odnotowany tryb TDD.
5. **`evidence.md`** (`../blind-standards/templates/evidence.md`) dla każdego planu poza trivial bez zmiany zachowania: ścieżki techniczne, zdarzenia, dane i writerzy, obserwowalność, rollback. Wypełnij z kodu, `design.md` i polityk; luka domenowa = otwarta decyzja → stop.
6. **Zatwierdzenie polityki** (nowej lub zmienionej): wpis człowieka w nagłówku `policies.md` (kto, kiedy). Polityka już zatwierdzona i niezmieniona nie wymaga ponownego zatwierdzenia. Zacommituj plan, politykę i scenariusze techniczne wg `sdlc-standards`; w trybie standard pokaż podsumowanie i czekaj na akceptację.

## Czego nie robisz
Nie generujesz i nie zmieniasz scenariuszy biznesowych; nie zatwierdzasz polityki sam; nie dodajesz scenariuszy technicznych na każdą awarię, jeśli wynika ona z istniejącej polityki — wystarczy powiązanie.
