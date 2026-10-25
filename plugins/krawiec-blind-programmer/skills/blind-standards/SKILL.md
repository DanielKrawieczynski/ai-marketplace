---
name: blind-standards
description: Zasady Dylematu i Testu Ślepego Programisty — kryteria TSP, statusy dowodów, werdykt, role i niezależność, miejsce w /docs i /.vibe/plan. Użyj przy pytaniach o te zasady; pozostałe skille blind-* odsyłają tutaj.
---

# Zasady Ślepego Programisty

Pytanie, na które odpowiada plugin: **jakich dowodów potrzebuję, żeby odpowiedzialnie zatwierdzić PR, nie opierając decyzji na przeczytaniu kodu?**

Plugin jest **nakładką na `krawiec-sdlc`**: init, plan, implementacja TDD, review, dokumentacja i PR robią skille `krawiec-sdlc:sdlc-*`, a konwencje (ticket, gałąź, commity, push i PR tylko po potwierdzeniu, merge robi człowiek) wynikają z `sdlc-standards`. Tu jest tylko to, czego tam brakuje: zatwierdzone scenariusze, niezależne testy, dowody TSP-07…09 i Test. Bez `krawiec-sdlc` w sesji powiedz o tym i zaproponuj instalację (`claude plugin install krawiec-sdlc@krawiec`); nie odtwarzaj jego skilli.

## Zasady nadrzędne
1. **Zrozumienie ≠ dowód.** Opis i komentarze pomagają zrozumieć zmianę; pewność dają niezależne, mierzalne dowody powiązane z wymaganiem, commitem i wdrożonym artefaktem.
2. **Brak dowodu to pełnoprawny wynik** (`MISSING`), nie cichy zielony znak. Nie uśredniaj: pokrycie 95% nie zastępuje braku zachowania dla duplikatu zdarzenia, a zielony Quality Gate — braku rollbacku.
3. **Niezależność wynika z procesu**, nie z liczby agentów: osobny kontekst, wspólne źródło wymagań, możliwość dojścia do innego wniosku. Autor niezależnych testów nie widzi implementacji; skill `blind-test` nie ocenia implementacji ani kodu UT (zagląda do nich tylko, by zweryfikować wiarygodność dowodów).
4. **Wymagań nie wymyślasz.** Scenariusze zatwierdza człowiek (właściciel wymagania); agent może je proponować. Osiągalna ścieżka spoza scenariuszy to **WYMAGA DECYZJI — BLOKUJE ZATWIERDZENIE** (jak ją rozpoznać i zgłosić: `references/scenarios-format.md` → „Odkrycia podczas realizacji”); nikt nie wybiera reguły po cichu.
5. **Deklaracja nie jest dowodem.** Opis PR-a i słowa autora nie liczą się; liczą się raporty narzędzi dla **tego samego commita** (przy wdrożeniu także digestu obrazu).
6. **Metryka ma zakres i mianownik** (pokrycie zmienionego kodu: 187/200 linii), nie samą wartość procentową.
7. **Test ocenia wystarczalność materiału, nie decyzję o merge.**

## Statusy i werdykt
Status kryterium: `PASSED`, `FAILED`, `MISSING` (brak lub nieweryfikowalny), `RUNNING` (kontrola trwa — materiał niekompletny), `NOT_APPLICABLE` (tylko z uzasadnieniem **i zatwierdzeniem człowieka**; bez zatwierdzenia liczy się jak `MISSING`).
Werdykt: **WYSTARCZAJĄCY** — każde wymagane kryterium ma wiarygodny dowód dla właściwej wersji (może to być `FAILED`, byle wiarygodny) i brak otwartych decyzji. **NIEWYSTARCZAJĄCY** — brakuje dowodu, jego źródło, zakres lub wersja są nieweryfikowalne albo decyzja jest otwarta. `FAILED` + `WYSTARCZAJĄCY` jest możliwe: materiał wystarcza, by zobaczyć niepowodzenie.

## Gdzie co leży (układ `krawiec-sdlc`)
| Co | Gdzie |
|----|-------|
| scenariusze — kontrakt zachowania (`@tc-N`, Given/When/Then + skutki i zakazy) | `docs/scenarios/<obszar>.md` (wg `sdlc-standards/templates/docs/scenarios.md`) |
| zatwierdzenie scenariuszy (kto, kiedy, źródło; commit wskazuje `git blame`) | nagłówek `docs/scenarios/<obszar>.md` |
| poziomy testów, mapowanie `tc-N` → krok/test | `/.vibe/plan/<TICKET>/tests.md` (gdy plan go ma) |
| ścieżki techniczne, zdarzenia, dane, alerty, rollback (TSP-07…09), pochodzenie testów scenariuszowych | `/.vibe/plan/<TICKET>/evidence.md` (`templates/evidence.md`) |
| wynik Testu | `/.vibe/plan/<TICKET>/evidence-report.md` |
| zasady pluginu dla ludzi (kryteria, role) | `/docs` repo (ADR wg `sdlc-adr` dla decyzji o progach) |
Manifest dowodów (`manifest.json`) generuje zaufany etap CI, nie agent z kodem PR-a.

## Szczegóły (czytaj, gdy potrzebne)
| Plik | Kiedy |
|------|-------|
| `references/criteria.md` | kryteria TSP-01…09, wymagane dowody, progi |
| `references/scenarios-format.md` | scenariusze, ocena kompletności, GOTOWY / WYMAGA DOPRECYZOWANIA |
| `references/roles.md` | role, granice informacji, rozbieżności |
| `references/report-format.md` | format raportu Testu |
| `references/manifest.md` | kontrakt manifestu dla CI |
| `templates/evidence.md` | szablon `evidence.md` planu |
