---
name: blind-deliver
description: Od definicji zadania do PR-a z niezależnymi dowodami — zwykły przebieg krawiec-sdlc (init, plan, implementacja TDD, review, docs, PR) z zatwierdzonymi scenariuszami, niezależnymi testami scenariuszowymi i oceną dowodów. Użyj przy „dowieź zadanie metodą Ślepego Programisty” lub generowaniu kodu pod późniejszy blind-test.
---

# Zadanie → PR z dowodami

Przebieg `krawiec-sdlc` (`sdlc-deliver`) z dodatkową warstwą dowodów: **plan jest zwykły, implementacja idzie w TDD, a obok powstają niezależne testy scenariuszowe i dowody TSP-07…09**. Zasady, role, bramki: `../blind-standards/SKILL.md`, `../blind-standards/references/roles.md`. Wywołuj skille `krawiec-sdlc:sdlc-*` wg ich `SKILL.md`; ten skill opisuje tylko odstępstwa i dodatki. Brak `krawiec-sdlc` → stop (patrz `blind-standards`).

## Tryby
| Tryb | Zatrzymanie i czekanie na człowieka |
|------|-------------------------------------|
| **standard** *(domyślny)* | zatwierdzenie scenariuszy i planu; przed utworzeniem każdego PR |
| **auto** | zatwierdzenie scenariuszy; przed utworzeniem każdego PR |

**Zatwierdzenie scenariuszy jest obowiązkowe w obu trybach** — agent nie zatwierdza wymagań. Zatrzymania jak w `sdlc-deliver` oraz przy otwartej decyzji domenowej (**WYMAGA DECYZJI — BLOKUJE ZATWIERDZENIE**). Pozostałe zasady `sdlc-deliver` obowiązują bez zmian: kolejność gałęzi przy wielu PR-ach, wynik build i testów z ostatniej rundy review dla bieżącego HEAD, krytyczne i istotne uwagi naprawiane od razu.

## 0. Przygotowanie
`<TICKET>`, ticket z Jiry, gałąź wg `sdlc-standards`; **zapytaj raz o commity** (odpowiedź obowiązuje w całym przebiegu). Brak `/.vibe/` (sam `plan/` się nie liczy) → `krawiec-sdlc:sdlc-init`; odmowa — kontynuuj z ostrzeżeniem, że plan i dowody będą mniej trafne.

## 1. Scenariusze — `blind-ready`
Uruchom wg jego `SKILL.md`. WYMAGA DOPRECYZOWANIA → stop z jednym zbiorczym pytaniem (razem z pytaniami planu, których już dotyka). GOTOWY → pokaż scenariusze i **czekaj na zatwierdzenie**, zapisz wpis zatwierdzenia w nagłówku `docs/scenarios/` (kto, kiedy) i zacommituj scenariusze. Od tej chwili wszyscy pracują na tej rewizji.

## 2. Plan — `krawiec-sdlc:sdlc-plan`
Zwykły plan w `/.vibe/plan/<TICKET>/` (złożoność, pliki, PR-y, kroki, `tests.md` z tabelą `tc-N`, jeśli plan go ma — poszerzoną o kolumny **poziom testu** i **niezależny test**; bez `tests.md` zapisz poziom przy kroku w `steps.md`). Dodatkowo **`evidence.md`** (`../blind-standards/templates/evidence.md`) dla każdego planu poza trivial bez zmiany zachowania: ścieżki techniczne, zdarzenia, dane i writerzy, obserwowalność, rollback. Wypełnij z kodu i z `design.md`; luka domenowa = otwarta decyzja → stop. Każdy `tc-N` musi mieć krok i test, a kroki z logiką — odnotowany tryb TDD. Zacommituj; w trybie standard pokaż podsumowanie i czekaj na akceptację.

## 3. Dla każdego PR z `steps.md`, w kolejności wdrożenia
Niezależne PR-y mogą iść równolegle (`sdlc-implement` → „PR-y i równoległość”).

**a. Testy niezależne** (przed implementacją, dla istotnego zachowania). `krawiec-blind-programmer:blind-scenario-tester`: przekaż pełne ścieżki `docs/scenarios/`, `tests.md`, `evidence.md`, publicznych kontraktów i zakres PR — **bez** implementacji, diffu i UT. Najpierw propozycja przypadków; Ty oceniasz ją (bramka 2 z `roles.md`), potem tester pisze testy przez istniejącą lub uzgodnioną granicę z tagiem `@tc-N`. Sprawdź RED (bramka 3). Test-first niewykonalny lub nieproporcjonalny → zapisz powód i wymagaj niezależnego review UT. **Nie commituj testów w stanie czerwonym** — zostają w drzewie roboczym do GREEN. Pochodzenie zapisz w sekcji „Pochodzenie” w `evidence.md` z raportu testera: pliki, które dostał i których nie dostał, commit bazowy, sumy `git hash-object` plików testów po RED.

**b. Implementacja TDD** — `krawiec-sdlc:sdlc-implement-tdd` bez zmian (tester → implementer → refaktoryzator, jego bramki). Dodatki: brief zawiera testy scenariuszowe jako **„nie zmieniaj, mają przejść w GREEN”**; sumy `git hash-object` obejmują je razem z testami UT; implementer zgłasza nową osiągalną ścieżkę jako WYMAGA DECYZJI (stop; po decyzji aktualizacja `docs/scenarios/`, `tests.md`, `evidence.md`). Pętla rozbieżności wg `roles.md`.

**c. Review** — `krawiec-sdlc:sdlc-review` (standard; security i nfr przy `nfr-impact`) oraz `krawiec-blind-programmer:blind-reviewer` w trybach `tests` (czy asercje sprawdzają scenariusze i skutki zabronione) i `impl` (ścieżki spoza scenariuszy). Krytyczne i istotne napraw, max 2 rundy, resztę do opisu PR.

**d. Dokumentacja** — `krawiec-sdlc:sdlc-docs` (tryb `zmiany`): `docs/scenarios/` zgodne z zachowaniem; kryteria i decyzje o progach → ADR (`sdlc-adr`).

**e. Ocena wstępna** — `blind-test` w trybie lokalnym, najlepiej w świeżym kontekście (`blind-reviewer`, tryb `audit`); w poleceniu przekaż mu raport trybu `tests` z kroku c, bo świeży kontekst go nie zna. To, co możesz wytworzyć sam (mapowanie `tc-N` → test, brakująca sekcja `evidence.md`, brakujący test), uzupełnij — max 2 rundy. Resztę (preprodukcja, Quality Gate, probe'y, alerty, niezależna opinia człowieka) przenieś do PR jako jawne braki; to normalny stan przed CI.

**f. Pull Request** — `krawiec-sdlc:sdlc-pr`, z dodatkami w opisie: rewizja i zatwierdzenie scenariuszy, tabela `tc-N` → test → wynik, role agentów i rozdzielenie kontekstów, lista braków z `blind-test`, ograniczenia dowodu. Zawsze punkt kontrolny przed push i utworzeniem PR; merge robi człowiek.

## Podsumowanie końcowe
Linki do PR-ów · commity · rewizja scenariuszy · tabela PR-ów (scenariusze, testy, rundy bramek, odchylenia) · wynik wstępnego `blind-test` z listą braków · założenia przyjęte bez potwierdzenia · po CI uruchom `blind-test` w trybie PR (ocena na dowodach z CI i wdrożenia).
