# Scenariusze zachowania

Zadanie opisuje potrzebę i reguły biznesowe w języku PO. Programista (lub agent) tłumaczy je na proste ścieżki zachowania niezależne od implementacji. **Zatwierdza je człowiek** — właściciel wymagania; nie musi edytować repo, wystarczy, że potwierdzi czytelną propozycję.

## Format
Scenariusze to zwykłe scenariusze `krawiec-sdlc`: `docs/scenarios/<obszar>.md`, trwałe ID `@tc-N` (numeracja ciągła w repo, nie używaj numeru ponownie, wycofany oznacz „(wycofany)”), wzór `sdlc-standards/templates/docs/scenarios.md`. Ślepy Programista wymaga w nich więcej treści w kroku `Then`/`And`:

```
Scenario: <opis biznesowy>
@tc-<N>
Given <stan początkowy i istotne dane>
When <zdarzenie lub działanie, np. POST /payments/{id}/complete>
Then <wynik widoczny z zewnątrz>
And <stan danych lub operacja zmieniająca stan: zapis, wywołanie API, zdarzenie, plik>
And <skutek, który nie może wystąpić, np. nie publikuje drugiego zdarzenia>
```
Poziom testu (hermetyczny / integracyjny / E2E-smoke) i uzasadnienie zapisz w tabeli `tests.md` planu (gdy plan go ma; inaczej przy kroku w `steps.md`), nie w scenariuszu. Zmiana znaczenia = nowy numer; nie edytuj zatwierdzonego scenariusza po cichu.

## Zatwierdzenie i aktualność
Zatwierdzenie to wpis człowieka w nagłówku `docs/scenarios/<obszar>.md`, w tym samym commicie co scenariusze:
```
<!-- Zatwierdzenie: <TICKET> · tc-12…tc-19 · <osoba> · <data> · źródło: <link, rewizja> -->
```
Przed zatwierdzeniem: `<!-- PROPOZYCJA — niezatwierdzone: <TICKET> · tc-12…tc-19 -->`. Scenariusze są na gałęzi zawsze aktualne (nie czekają na merge jak `/docs`). Aktualność pilnują: `sdlc-implement` (dopisuje nowe i zmienione `tc-N`), `sdlc-docs` w trybie `zmiany` (zgodność z zachowaniem) oraz `blind-test` (porównanie z commitem zatwierdzenia). Zmiana zatwierdzonego `tc-N` wymaga nowego wpisu; bez niego `blind-test` zwraca `NIEWYSTARCZAJĄCY`.

## Ocena kompletności (`blind-ready`)
Zadanie jest **GOTOWE**, gdy:
1. każdy scenariusz ma stan początkowy, działanie, obserwowalny wynik, operacje zmieniające stan i zakazane skutki;
2. opisano błędy z kontraktu biznesowego i wynik każdego (API, stan, zdarzenie);
3. dla zmienianego przepływu rozstrzygnięto niedostępność/timeout zależności, anulowanie (`CancellationToken` lub odpowiednik), zamknięcie i restart procesu — wynik, praca w toku, retry/kompensacja, alarm, odpowiedzialny;
4. dla istotnych zdarzeń opisano duplikat, opóźnienie, zmianę kolejności, ponowienie, niedostępność — albo zapisano, że nie dotyczą, z powodem;
5. określono właściciela danych i writerów (także z innych repo tej samej solucji), niezmienniki, stany dopuszczalne / niedozwolone / do naprawy, złe dane (odrzucić, naprawić, kwarantanna, zgłosić) i zabronione skutki uboczne;
6. określono wykrywanie awarii: sygnały, alerty (warunek, okno, pilność, odbiorca, reakcja), potrzebę dashboardu, reakcję automatyczną, przeszkody dla rollbacku;
7. brak otwartych „WYMAGA DECYZJI”.

Inaczej: **WYMAGA DOPRECYZOWANIA** + konkretne pytania do autora zadania (jedno zbiorcze pytanie, z przykładowymi odpowiedziami oznaczonymi jako propozycje). Przykładowa odpowiedź nigdy nie jest zatwierdzonym wymaganiem.

## Odkrycia podczas realizacji
Realna wartość z granicy systemu lub zależności (np. `null` w polu, które kontrakt API uznaje za obecne) to ścieżka systemu do rozstrzygnięcia. Sztuczny argument metody wewnętrznej, który nie dotrze tam z realnego przepływu, nie wymaga scenariusza; niemożliwość musi wynikać z kontraktu lub egzekwowanego niezmiennika, nie z założenia implementera. Zgłoszenie: **WYMAGA DECYZJI — BLOKUJE ZATWIERDZENIE**, opis ścieżki, warianty, wpływ (wynik, stan, działanie zewnętrzne, odzyskiwanie). Po decyzji: aktualizacja źródła, `docs/scenarios/` i `tests.md`.
