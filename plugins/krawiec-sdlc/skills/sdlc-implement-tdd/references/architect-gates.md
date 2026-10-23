# Bramki architekta

Wynik podaj jako „Bramka <faza>: ZALICZONA / NIEZALICZONA” z listą uwag. Uwagi do roli formułuj konkretnie: plik, test lub metoda, co jest nie tak, czego oczekujesz.

## RED — testy
- [ ] Każdy scenariusz z briefu ma test; nie ma testów spoza briefu bez uzasadnienia.
- [ ] Testy wyrażają reguły ze źródeł (PRD, ticket, model), także ścieżki błędów i przypadki brzegowe.
- [ ] Testują zachowanie przez publiczne API, nie szczegóły implementacji; bez nadmiernego mockowania.
- [ ] Nowe testy padają z właściwego powodu; żaden nie przechodzi bez implementacji.
- [ ] Szkielety bez logiki; sygnatury zgodne z briefem i planem.
- [ ] Nazwy i struktura wg `code-standards.md` i konwencji repo; język domeny z modelu.

## GREEN — implementacja
- [ ] Sumy kontrolne plików testowych bez zmian; testy zielone, build bez nowych ostrzeżeń.
- [ ] Zakres zgodny z krokiem — nic ponad brief i testy.
- [ ] Reguły i niezmienniki z briefu zachowane także w ścieżkach bez testów (luka = brak w RED: dopisz scenariusz i wróć do RED).
- [ ] Zgodność z `code-standards.md`; `nfr.md` przy `nfr-impact`.
- [ ] Brak zmian kontraktów i zależności spoza planu.

## REFACTOR — jakość
- [ ] Testy zielone; asercje i scenariusze bez zmian.
- [ ] Zmiany tylko w kodzie z kroku; zachowanie i sygnatury publiczne bez zmian.
- [ ] Kod czytelniejszy niż po GREEN (albo uzasadniony brak zmian).
- [ ] Zgodność z `code-standards.md`; brak nowych problemów typu duplikacja, złożoność, martwy kod.

## Spory między rolami
Źródło prawdy w kolejności: ticket i PRD → plan → model domenowy → standardy. Źródła sprzeczne lub milczą — zapytaj człowieka.
