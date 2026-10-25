# Format raportu Testu Ślepego Programisty

```markdown
# Test Ślepego Programisty — <TICKET> / PR #<n>
Commit: <pełny SHA> · Obraz: <digest albo „brak dowodu”> · Środowisko: <nazwa albo „brak”> · Data oceny: <data>

## Werdykt: WYSTARCZAJĄCY | NIEWYSTARCZAJĄCY
<2–4 zdania: dlaczego; jeśli NIEWYSTARCZAJĄCY — liczba braków i najważniejszy z nich>

## Czego brakuje
| # | Kryterium / scenariusz | Brak | Kto może dostarczyć | Jak dostarczyć |
|---|------------------------|------|---------------------|----------------|
Pusta lista: „brak”.

## Decyzje nierozstrzygnięte
<WYMAGA DECYZJI z odnośnikiem albo „brak”>

## Kryteria
| ID | Status | Dowód (źródło, zakres, mianownik, commit) | Uwagi |
|----|--------|-------------------------------------------|-------|
| TSP-01 | PASSED / FAILED / MISSING / RUNNING / NOT_APPLICABLE | … | próg: <wartość i skąd> |

## Scenariusze
| ID | Poziomy | Testy | Wynik | Niezależna ocena asercji |
|----|---------|-------|-------|--------------------------|

## Pochodzenie i niezależność
Kto przygotował kod i UT, kto testy scenariuszowe, kto ocenił przypisania; czy konteksty były rozdzielone — fakty z repo/PR, nie deklaracje.

## Ograniczenia dowodu
Czego raport nie weryfikuje (np. walidacja tokena, nieobjęte zależności, przetrwałe mutanty bez uzasadnienia).

## Co wynika z wyników
Osobno od werdyktu: kontrole `FAILED` i ich znaczenie. Bez rekomendacji merge.
```
Zasady: statusy bez uśredniania; każdy procent z licznikiem, mianownikiem i zakresem; dowód z innego commita/obrazu = `MISSING` dla tej próby; „Czego brakuje” ma być wykonalne (konkretny raport, konkretny scenariusz), nie ogólne.
