# Changelog

Format: `<plugin> [MAJOR.MINOR.PATCH]`.

## 1.0.0 — 2026-10-23

Wersja uniwersalna, niezależna od organizacji.

- `krawiec-sdlc` — `sdlc-standards`, `sdlc-init`, `sdlc-plan`, `sdlc-implement`, `sdlc-implement-tdd`, `sdlc-review`, `sdlc-docs`, `sdlc-pr`, `sdlc-deliver`, `sdlc-adr`; podagenci `sdlc-reviewer`, `sdlc-tdd-*`; serwer MCP `atlassian`; hook SessionStart wstrzykujący zasady.
- Przepisane od zera: zasady podstawowe wstrzykiwane hookiem w każdej sesji w ≈ 3 KB (było ≈ 7 KB), szczegóły w `references/` czytanych na żądanie, krótsze `SKILL.md` (≈ -33%) i opisy skilli (≈ -25%); plan w 4 plikach (`overview`, `design`, `tests`, `steps`), PRD w 12 sekcjach, `/.vibe` numerowane 01–07, kontrola niezmienności testów w TDD przez `git hash-object`.
- Punkt rozszerzenia: opcjonalny skill `org-standards` z pluginu organizacji (reguła w `sdlc-standards`, szkielet w `templates/org-standards/`).
- Standardy kodu, NFR i asercje w testach zapisane niezależnie od języka i frameworka.
