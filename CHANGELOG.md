# Changelog

Format: `<plugin> [MAJOR.MINOR.PATCH]`.

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
