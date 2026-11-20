# Changelog

Format: `<plugin> [MAJOR.MINOR.PATCH]`.

## krawiec-blind-programmer 1.2.0 — 2026-11-20

Nowy skill `blind-plan`; `blind-ready` wraca do oceny kompletności zadania.

- `blind-plan`: wywołuje `sdlc-plan` i uzupełnia plan o pokrycie polityki technicznej, scenariusze techniczne (`technical-cases.md`), mapowanie do testów (biznesowe wierszami, techniczne zbiorczo per polityka) i `evidence.md`. Nowa lub zmieniona polityka wymaga zatwierdzenia człowieka; zatwierdzona i niezmieniona nie.
- `blind-ready`: przepuszcza zadanie, które opisuje historyjki i scenariusze biznesowe, bez generowania scenariuszy technicznych; sprawdza też kolizje nazw z zatwierdzonymi scenariuszami i dokumentacją.
- `blind-deliver`: krok 2 to `blind-plan` (w tym `evidence.md`), zatwierdzenie polityki w tym kroku.
- `krawiec-sdlc` bez zmian (1.1.1).

## 1.1.1 — 2026-11-20

Domknięcie zmian z 1.1.0 (`krawiec-sdlc` i `krawiec-blind-programmer`).

- `blind-deliver`: zatwierdzenie obejmuje historyjki, scenariusze biznesowe i politykę techniczną; scenariuszy technicznych nie pokazuje się pojedynczo.
- `blind-test`, `criteria.md` (TSP-05), `roles.md`, agenci `blind-scenario-tester` i `blind-reviewer`: scenariusze biznesowe mapowane osobno, techniczne zbiorczo per polityka; zatwierdzenie polityki jest warunkiem werdyktu.
- `sdlc-plan`: pytanie zbiorcze ma format sytuacja / co zmienia decyzja / rekomendacja.
- `scenarios-format.md`: usunięte pojęcie „wersja minimum”.
- `terminology/la.md`: etap po łacinie to `stadium` (było `gradus`), żeby odróżnić go od kroku (`passus`).

## 1.1.0 — 2026-11-19

Historyjki, scenariusze biznesowe i techniczne, polityka techniczna oraz etapy i kroki planu (`krawiec-sdlc` i `krawiec-blind-programmer`).

- Nowe nazewnictwo w `sdlc-standards/references/terminology/`: `pl.md` (hist, sc, etap, krok), `en.md` (us, tc, stage, task; domyślny dla pozostałych języków), `la.md` (fabula, casus, gradus, passus; na prośbę). Repo z własną numeracją (np. ciągłe `@tc-N`) zachowuje ją.
- `scenarios-format.md` przepisany: historyjka ma jak najmniej scenariuszy biznesowych (zwykle 3–7), jedna ścieżka = jeden scenariusz, podział na scenariusze biznesowe (`docs/scenarios/<obszar>.md`), politykę techniczną (`policies.md`, zatwierdzana raz) i scenariusze techniczne (`technical-cases.md`). Ocena kompletności sprawdza pokrycie polityki zamiast wymuszać scenariusze na każdą awarię. Pytania `blind-ready` mają format: sytuacja, co zmienia decyzja, rekomendacja.
- Plan: etapy (jeden etap = jeden PR, należy do jednej historyjki) zamiast „PR-ów”; kamień milowy tylko jako opcjonalny znacznik na liście historyjek. Zmienione `steps.md`, `tests.md`, `plan-format.md`, `sdlc-implement` („Etapy i równoległość”), `sdlc-deliver`, `blind-deliver`.
- ID scenariuszy `tc-N` zastąpione `sc-X-Y` w skillach, agentach i szablonach `krawiec-blind-programmer`. Nowe szablony: `policies.md`, `technical-cases.md`.

## krawiec-blind-programmer 1.0.0 — 2026-10-25

Nowy plugin oparty na Dylemacie i Teście Ślepego Programisty, jako nakładka na `krawiec-sdlc` (wymaga go w sesji).

- Skille: `blind-standards` (zasady, kryteria TSP-01…09, statusy, role, formaty, szablon `evidence.md`), `blind-ready` (kompletność zadania, scenariusze `tc-N`), `blind-deliver` (zadanie → PR: `sdlc-init`, `sdlc-plan`, `sdlc-implement-tdd`, `sdlc-review`, `sdlc-docs`, `sdlc-pr` plus niezależne testy scenariuszowe i ocena dowodów), `blind-test` (werdykt WYSTARCZAJĄCY / NIEWYSTARCZAJĄCY i lista braków).
- Podagenci: `blind-scenario-tester` (testy bez dostępu do implementacji), `blind-reviewer` (tryby `tests`, `impl`, `audit`). Role TDD przejmują podagenci `sdlc-tdd-*`.
- Odchylenia od źródła (docs Ślepego Programisty): „AKS” uogólniono do „orkiestratora (np. AKS)” w TSP-04 i TSP-06; ID `SCN-*` zastąpiono `tc-N` z `krawiec-sdlc`; `blind-test` czyta kod i testy tylko do weryfikacji dowodów (docs zmieniono tak samo).
- Dokumentacja: scenariusze w `docs/scenarios/`, plan w `/.vibe/plan/<TICKET>/` z nowym plikiem `evidence.md` i wynikiem `evidence-report.md`.

## 1.0.0 — 2026-10-23

Wersja uniwersalna, niezależna od organizacji.

- `krawiec-sdlc` — `sdlc-standards`, `sdlc-init`, `sdlc-plan`, `sdlc-implement`, `sdlc-implement-tdd`, `sdlc-review`, `sdlc-docs`, `sdlc-pr`, `sdlc-deliver`, `sdlc-adr`; podagenci `sdlc-reviewer`, `sdlc-tdd-*`; serwer MCP `atlassian`; hook SessionStart wstrzykujący zasady.
- Przepisane od zera: zasady podstawowe wstrzykiwane hookiem w każdej sesji w ≈ 3 KB (było ≈ 7 KB), szczegóły w `references/` czytanych na żądanie, krótsze `SKILL.md` (≈ -33%) i opisy skilli (≈ -25%); plan w 4 plikach (`overview`, `design`, `tests`, `steps`), PRD w 12 sekcjach, `/.vibe` numerowane 01–07, kontrola niezmienności testów w TDD przez `git hash-object`.
- Punkt rozszerzenia: opcjonalny skill `org-standards` z pluginu organizacji (reguła w `sdlc-standards`, szkielet w `templates/org-standards/`).
- Standardy kodu, NFR i asercje w testach zapisane niezależnie od języka i frameworka.
