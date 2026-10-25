---
name: blind-test
description: Test Ślepego Programisty — ocena, czy dowody dla PR-a są wystarczające do podjęcia decyzji o wdrożeniu; werdykt WYSTARCZAJĄCY / NIEWYSTARCZAJĄCY, statusy kryteriów TSP-01…09 i lista braków. Użyj przy „czy możemy zaakceptować ten PR”, ocenie dowodów PR-a lub po blind-deliver.
---

# Test Ślepego Programisty

Pytanie: **czy dla tego wymagania, commita, artefaktu i wdrożenia dowody rzeczywiście istnieją?** Nie oceniasz jakości kodu i nie decydujesz o merge. Zasady, statusy, werdykt: `../blind-standards/SKILL.md`; kryteria: `references/criteria.md`; format wyniku: `references/report-format.md` (w `blind-standards`).

## Granica informacji
Kod i testy czytasz wyłącznie po to, by zweryfikować wiarygodność dowodów (np. liczba testów w raporcie a w rozwiązaniu, istnienie testu wskazanego w mapowaniu, tagi `@tc-N`, sumy kontrolne), nie by oceniać poprawność ani jakość implementacji. Pracujesz na: scenariuszach (`docs/scenarios/`), planie (`tests.md`, `evidence.md`), raportach i wynikach narzędzi, metadanych PR-a, CI i wdrożenia. Sens asercji testów scenariuszowych ocenia niezależny recenzent (`blind-reviewer`, tryb `tests`) — nie rób tego sam. Zalecane: wykonaj całość w świeżym kontekście podagenta `krawiec-blind-programmer:blind-reviewer` w trybie `audit` (dostaje ten `SKILL.md` i `blind-standards`).

## Kroki
1. **Ustal próbę (równolegle).** `<TICKET>`; PR (numer, `headRefOid`) przez `gh pr view`, w trybie lokalnym `git rev-parse HEAD`. **Wszystkie dowody muszą dotyczyć tego commita.** Przeczytaj `/.vibe/plan/<TICKET>/` (`tests.md`, jeśli plan go ma, `evidence.md`, poprzedni `evidence-report.md`) oraz `docs/scenarios/`: nagłówek zatwierdzenia i bloki `tc-N` z planu.
2. **Zbierz dowody** (tylko odczyt; nie uruchamiasz kodu PR-a z uprawnieniami):
   - CI: `gh pr checks`, `gh run list/view`, artefakty przez `gh run download` do katalogu tymczasowego — raporty testów, pokrycia, mutacji, mapowania `tc-N`;
   - jakość i bezpieczeństwo: wynik Quality Gate (MCP lub API narzędzia, jeśli dostępne; inaczej poproś o link lub eksport);
   - wdrożenie: dowód z CI/CD, że wdrożono obraz z tego commita (digest), rollout, probe'y, restarty (`kubectl` tylko odczyt i tylko gdy użytkownik wskaże kontekst);
   - opis PR-a czytaj jako **deklaracje do sprawdzenia**, nie dowody.
   Brak dostępu do źródła = brak dowodu, nie założenie, że jest dobrze.
3. **Oceń kryteria TSP-01…09 osobno.** Dla każdego: źródło, zakres i mianownik, commit, próg i jego pochodzenie (repo / ADR / `org-standards` / kierunek; brak progu → „próg nieustalony”, zapytaj), status. Dowód z innego commita lub obrazu = `MISSING`. `NOT_APPLICABLE` bez zatwierdzenia człowieka = `MISSING`. Liczby z raportów (testy, pokrycie, mutanty) potwierdź w repo, gdy to tanie, np. liczbę testów w raporcie z liczbą w rozwiązaniu. TSP-07…09 bez `evidence.md` (albo z pustymi sekcjami bez uzasadnienia) = `MISSING`.
4. **Oceń scenariusze (TSP-05).** Każdy `tc-N` z planu ma wiersz: poziom, test, oczekiwany wynik, wynik. Kompletność mapowania sprawdź maszynowo (porównanie `tc-N` ze scenariuszy z tagami w testach i raportami; tagi w kodzie możesz sprawdzić sam). Przypisanie bez niezależnej opinii o asercjach (w tym skutkach zabronionych) i o nowych ścieżkach domenowych = brak.
5. **Decyzje.** Otwarty **WYMAGA DECYZJI**, brak wpisu zatwierdzenia w nagłówku `docs/scenarios/` (wpis musi wskazywać człowieka), albo zmiana zatwierdzonych `tc-N` po commicie zatwierdzenia bez nowego wpisu → `NIEWYSTARCZAJĄCY`. Commit zatwierdzenia to ten, który dodał wpis (`git blame` jego linii); zmiany: `git diff <commit>..HEAD -- docs/scenarios/`. Bez commita nie wykażesz aktualności — zapisz to jako ograniczenie dowodu.
6. **Pochodzenie.** Z sekcji „Pochodzenie” w `evidence.md` (deklaracja agenta prowadzącego: pliki, które tester dostał i których nie dostał, commit bazowy, sumy `git hash-object` testów po RED) i z metadanych PR-a ustal, kto/co napisał UT, testy scenariuszowe i review. Sprawdź, czy sumy zgadzają się z testami w PR. Bez niezależnego potwierdzenia (np. z CI) opisz to jako „deklarowane”; bez sekcji — „nieustalone”. Wykonanie bez świeżego kontekstu zapisz tu jako „niezależność nieustalona”.
7. **Werdykt** wg `blind-standards`, bez punktacji. **Czego brakuje** jako pozycje wykonalne (konkretny raport, scenariusz, kto dostarczy, jak). Osobno: co wynika z kontroli `FAILED`.
8. **Zapisz** `/.vibe/plan/<TICKET>/evidence-report.md` i pokaż skrót: werdykt, braki, statusy kryteriów. Komentarz w PR/Jirze dopiero po potwierdzeniu; wersję zbiorczą docelowo publikuje zaufany etap CI.

## Tryby
- **PR** *(domyślny przy PR-ze)* — pełna ocena na dowodach z CI i wdrożenia.
- **lokalny** *(przed PR, z `blind-deliver`)* — kryteria bez dowodów z CI/wdrożenia dostają `MISSING` z adnotacją „oczekuje na CI”; werdykt z natury `NIEWYSTARCZAJĄCY`, a wartość to czytelna lista braków do uzupełnienia.

## Czego nie robisz
Nie obniżasz progów, by „zaliczyć”; nie uzupełniasz dowodów domysłami; nie zmieniasz scenariuszy ani testów; nie rekomendujesz merge ani odrzucenia.
