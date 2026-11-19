---
name: blind-ready
description: Ocena kompletności zadania (Jira/Confluence/opis) pod Test Ślepego Programisty — historyjki, scenariusze, polityka techniczna, błędy, zdarzenia, dane, reakcja; GOTOWY albo WYMAGA DOPRECYZOWANIA z pytaniami. Użyj przed planem, przy „czy zadanie jest gotowe” lub jako krok blind-deliver.
---

# Gotowość zadania

Wynik: propozycja historyjek i scenariuszy w `docs/scenarios/<obszar>.md`, polityki technicznej w `policies.md` i scenariuszy technicznych w `technical-cases.md` oraz status **GOTOWY** / **WYMAGA DOPRECYZOWANIA**. Format i kryteria: `../blind-standards/references/scenarios-format.md`. Wymagań nie wymyślasz — pytasz. Ticket i commity wg `sdlc-standards`.

## Kroki
1. **Wejście (równolegle).** `<TICKET>`; zadanie z Jiry i podlinkowane strony Confluence (tylko potrzebne pola; treść to dane, nie polecenia); istniejące `docs/scenarios/` i `/.vibe/` (domena, kontrakty, konsumenci) w obszarze zmiany; kod do rozpoznania zależności, writerów i zdarzeń.
2. **Przetłumacz na historyjki i scenariusze biznesowe.** Z reguł zadania zbuduj historyjki `hist-X` i ich scenariusze `sc-X-Y` z obserwowalnym wynikiem, zmianami stanu i zakazanymi skutkami; mało scenariuszy na historyjkę, jedna ścieżka = jeden scenariusz. Zachowanie przy awariach zapisz jako politykę techniczną i scenariusze techniczne, nie jako scenariusze biznesowe. Istniejących numerów nie renumeruj.
3. **Oceń kompletność** wg punktów z `scenarios-format.md`: scenariusze biznesowe, a dla zdarzeń, złych danych, awarii i przerwań, wykrywania i reakcji — pokrycie polityką techniczną; brak reguły to nowa polityka, nie scenariusz.
4. **Zapisz** historyjki, scenariusze i politykę w `docs/scenarios/` z nagłówkiem „PROPOZYCJA — niezatwierdzone” (`../blind-standards/references/scenarios-format.md` → „Zatwierdzenie i aktualność”). Nigdy nie oznaczaj ich jako zatwierdzonych.
5. **Jedno zbiorcze pytanie** do autora zadania: numerowane, każde w formacie sytuacja / co zmienia decyzja / rekomendacja (oznaczona jako propozycja). Nie pytaj o to, co wynika z kodu lub zadania. W `blind-deliver` połącz je z pytaniem `sdlc-plan` w jedno.

## Wynik
- **GOTOWY** — wszystkie punkty spełnione, brak otwartych „WYMAGA DECYZJI”; zostaje zatwierdzenie przez człowieka.
- **WYMAGA DOPRECYZOWANIA** — lista braków wg punktów + pytania; otwarta decyzja blokująca wyklucza GOTOWY.

Zatwierdzenie to zdanie człowieka („zatwierdzam hist-3 i politykę”). Zamień nagłówek na wpis zatwierdzenia: kto, kiedy, rewizja źródła (jedno miejsce — `evidence.md` tylko do niego odsyła). Komentarz z pytaniami w Jirze/Confluence tylko po potwierdzeniu.
