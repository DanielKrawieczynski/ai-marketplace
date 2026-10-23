---
name: sdlc-review
description: Review zmian przed PR — zgodność z planem, jakość, testy, bezpieczeństwo, dokumentacja, build, wpływ na inne repo. Tryby standard, security, nfr, full. Użyj przy prośbie o review, pre-PR check, przegląd bezpieczeństwa lub NFR.
---

# Review przed PR

Wynik: raport (`../sdlc-standards/references/review-report-format.md`). Plików nie zmieniasz, dopóki człowiek nie zaakceptuje raportu.

## Tryby
- **standard** *(domyślny)* — sekcje 1–7 poniżej,
- **security** — `references/security.md`,
- **nfr** — `references/nfr.md`,
- **full** — wszystkie kolejno.

## Kontekst (równolegle)
- Diff: `git diff <baza>...HEAD` (baza: `main` / `master` wg `origin/HEAD`) albo `git diff` / `git diff --staged` dla zmian niezacommitowanych; `git log <baza>..HEAD`. **Zacznij od `--stat`**; dla dużego diffu czytaj plik po pliku, najpierw kod produkcyjny, potem testy.
- `steps.md` planu (jeśli jest) i ticket z Jiry — kryteria akceptacji.
- Tylko gdy potrzebne: pliki planu wskazane w krokach (gdy diff odbiega od kroku), `/.vibe/` i `/docs/` (kontrakty, zależności), skill `org-standards` (code review, bezpieczeństwo, testy).

**Podagent.** Gdy review jest częścią `sdlc-deliver` albo prosisz o niezależne, a dostępny jest `krawiec-sdlc:sdlc-reviewer` (chyba że sam nim jesteś) — zleć mu review: tryb, `<TICKET>`, bazę oraz pełne ścieżki `SKILL.md` tego skilla i `sdlc-standards`. Recenzent ze świeżym kontekstem nie zna intencji autora i nie zużywa kontekstu sesji.

---

# Tryb standard

1. **Zgodność z planem:** wszystkie kroki zrobione; nic spoza planu ani usuniętego bez uzasadnienia; kryteria akceptacji z ticketu spełnione.
2. **Jakość kodu:** analiza statyczna, jeśli jest narzędzie (zgodnie z „Systemy zewnętrzne” w `sdlc-standards`; klucz projektu z konfiguracji repo lub zapytaj): nowe issues o najwyższej wadze to krytyczne (quality gate), niższe — istotne; brak analizy zgłoś. Ponadto to, czego nie wyłapie analizator: `../sdlc-standards/references/code-standards.md`, TODO / FIXME bez ticketu, własne rozwiązanie lub zależność tam, gdzie wystarcza framework.
3. **Testy:** nowe klasy i metody mają testy jednostkowe; pokryte ścieżki sukcesu i błędu; brak testów „false positive”.
4. **Standardy i bezpieczeństwo:** zgodność ze „Standardami kodu”, brak sekretów w kodzie. Pełny przegląd — tryb security.
5. **Dokumentacja:** `/.vibe` zaktualizowane w krokach; `docs/adr.md` ma wpis dla istotnych decyzji; `/docs` spójne z kodem; zmiany kontraktów, zależności i opisu serwisu odzwierciedlone w pliku katalogu usług, jeśli repo go ma.
6. **Build i weryfikacja:** wg „Weryfikacja” w `sdlc-standards` (nie powtarzaj, jeśli analiza z punktu 2 zbudowała ten HEAD); Dockerfile, jeśli zmieniony; migracje — nowe pliki w kolejności, bez edycji już wdrożonych.
7. **Wpływ na inne repo** (gdy PR zmienia kontrakty): zmiana non-breaking albo jawnie oznaczona jako breaking; breaking przewidziany w tickecie wg „Zmiany kontraktów” w `../sdlc-standards/references/workflow.md`.

Po akceptacji raportu zastosuj poprawki i zacommituj wg `sdlc-standards`.
