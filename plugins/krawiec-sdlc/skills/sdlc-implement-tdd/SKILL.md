---
name: sdlc-implement-tdd
description: Implementacja planu metodą TDD z rolami — tester (red), implementer (green), refaktoryzator, a Ty jako architekt pilnujesz bramek. Użyj przy prośbie o TDD, test-first lub role agentów.
---

# Implementacja TDD z rolami

Wariant `sdlc-implement`: jego kontekst, „PR-y i równoległość” i „Czego nie robić” obowiązują. Ten skill zmienia tylko sposób realizacji kroku.

## Role
| Rola | Kto | Robi | Nie wolno |
|------|-----|------|-----------|
| **Architekt** | Ty | brief, bramki, decyzje, build i testy, commity, `/.vibe` | pisać testów ani kodu produkcyjnego za role |
| **Tester** | `references/roles/test-writer.md` | testy z briefu (RED) | implementować logikę |
| **Implementer** | `references/roles/implementer.md` | minimalny kod, który przechodzi testy (GREEN) | zmieniać testy |
| **Refaktoryzator** | `references/roles/refactorer.md` | struktura bez zmiany zachowania (REFACTOR) | zmieniać zachowanie i asercje |

**Uruchamianie ról.** Z podagentami (`sdlc-tdd-tester`, `sdlc-tdd-implementer`, `sdlc-tdd-refactorer`; w Claude Code i Copilot CLI z prefiksem `krawiec-sdlc:`) każdą fazę zlecaj **nowemu** wywołaniu: w poleceniu podaj pełną ścieżkę pliku roli, brief, ścieżki potrzebnych plików i — w kolejnych rundach — uwagi architekta oraz raport poprzedniej roli. Podagenci są tańsi (model sonnet) i nie dziedziczą Twoich rozważań. Bez podagentów graj role kolejno, przed każdą przeczytaj plik roli i ogłoś zmianę („Rola: Tester”), pracując wyłącznie na briefie, raportach i repo.

## Kontekst architekta
Jak w `sdlc-implement`, plus: `01-prd.md` (reguły, kryteria, przypadki brzegowe), `07-domain-model.md` (niezmienniki, język), `tests.md` planu, kryteria akceptacji z ticketu, `references/architect-gates.md`.

## Krok

**0. Klasyfikacja.** TDD — krok z logiką (domena, serwisy, walidacje, mapowania, konsumenci, endpointy). Bez TDD — migracja, konfiguracja, DI, wdrożenie, sama dokumentacja: zrób wg `sdlc-implement` i uzasadnij w podsumowaniu.

**1. Brief** (przekazujesz rolom): cel i odniesienie do planu; scenariusze zachowania, każdy ze źródłem (reguła PRD, kryterium z ticketu, niezmiennik, przypadek brzegowy); dozwolone typy i sygnatury publiczne; zakres plików do zmiany; reguły, których krok nie może naruszyć; commit bazowy (`git rev-parse HEAD` przed RED). Bez wskazówek implementacyjnych.

**2. RED.** Zleć testerowi. Potem sam: build musi przejść (szkielety dopuszczalne), **nowe testy muszą padać z właściwego powodu** (asercja lub „not implemented”, nie błąd setupu), istniejące przechodzą. Test zielony już w RED = zachowanie istnieje albo test jest słaby — wyjaśnij. Bramka RED; niezaliczona → odeślij (maks. 2 rundy).

**3. GREEN.** Zapisz sumy kontrolne plików testowych: `git hash-object <pliki testów>` (także nowych, niezacommitowanych). Zleć implementerowi. Potem sam: porównaj sumy — zmienione testy przywróć do stanu z RED i odeślij; build i testy zielone. Implementer zgłasza błędny test → rozstrzygnij: popraw brief i wróć do RED albo potwierdź test. Bramka GREEN (maks. 3 rundy). Commit testów i implementacji.

**4. REFACTOR.** Zleć refaktoryzatorowi. Potem: build i testy zielone, w testach tylko zmiany czytelności (asercje i scenariusze bez zmian). Brak wartościowych zmian to poprawny wynik — pomiń commit. Bramka REFACTOR; niezaliczona → cofnij zmiany (`git restore`) lub odeślij (maks. 2 rundy). Commit.

**5. Zamknięcie.** Zaktualizuj `/.vibe` wg `../sdlc-standards/templates/vibe/README.md`. Podsumuj krok: scenariusze ↔ testy, wyniki faz i bramek, decyzje, odchylenia od planu.

## Zatrzymaj się i zapytaj, gdy
limit rund bramki się wyczerpał; brief wymaga reguły biznesowej, której nie ma w PRD, tickecie ani modelu; test lub kod wymaga zmiany poza planem albo kontraktu (API, zdarzenie, schemat).

## Po wszystkich krokach
Tabela: krok, tryb (TDD / bez), liczba testów, rundy bramek, commity, odchylenia, otwarte kwestie.
