# Historyjki i scenariusze

Zadanie opisuje potrzebę i reguły biznesowe w języku PO. Programista (lub agent) tłumaczy je na historyjki i proste scenariusze niezależne od implementacji. **Zatwierdza je człowiek** — właściciel wymagania; nie musi edytować repo, wystarczy, że potwierdzi czytelną propozycję. Nazwy i ID: `krawiec-sdlc:sdlc-standards` → `references/terminology/` (tu `hist-X`, `sc-X-Y`, jak w `pl.md`).

## Układ
| Plik | Zawartość | Kto przegląda |
|------|-----------|---------------|
| `docs/scenarios/<obszar>.md` | historyjki i ich **scenariusze biznesowe** (z zadania; `blind-ready`) | człowiek, każdy scenariusz |
| `docs/scenarios/policies.md` | **polityka techniczna** P1, P2…: jak system zachowuje się, gdy coś zawodzi (`blind-plan`) | człowiek, raz |
| `docs/scenarios/technical-cases.md` | **scenariusze techniczne**: warianty i skutki polityk; każdy oznaczony polityką albo `T` (`blind-plan`) | nikt pojedynczo; wynikają z polityk |

Kryterium podziału: **czy użytkownik lub PO zauważy różnicę i będzie miał o niej zdanie?** Tak → scenariusz biznesowy. Nie (obsługa awarii, ponowienia, limity czasu, współbieżność, walidacja konfiguracji, format błędów) → polityka i scenariusz techniczny.

## Historyjka i scenariusz
- Historyjka `hist-X`: jedno zdanie „Jako … chcę … żeby …”. **Jak najmniej scenariuszy biznesowych**, zwykle 3–7. Gdy ich przybywa, a część dotyczy czegoś innego, to jest osobna historyjka, nie kolejne scenariusze. Etap planu należy do jednej historyjki.
- Scenariusz `sc-X-Y` (Y w obrębie historyjki): **jedna ścieżka = jeden scenariusz**. `And` opisuje kolejne skutki tego samego wejścia; inne dane wejściowe lub tryb (np. flaga) to osobny scenariusz.
- Numer nie zmienia znaczenia i nie jest używany ponownie; przeniesienie scenariusza do innej historyjki = nowy numer, wycofany oznacz „(wycofany)”. Zmiana samego miejsca zapisu (np. do `technical-cases.md`) nie jest zmianą znaczenia.
- Repo z ciągłym `@tc-N` zachowuje swoją numerację; nowy schemat obowiązuje nowe historyjki.

```
Scenario: <opis biznesowy>
@sc-<X>-<Y>
Given <stan początkowy i istotne dane>
When <zdarzenie lub działanie, np. POST /payments/{id}/complete>
Then <wynik widoczny z zewnątrz>
And <stan danych lub operacja zmieniająca stan: zapis, wywołanie API, zdarzenie, plik>
And <skutek, który nie może wystąpić, np. nie publikuje drugiego zdarzenia>
```
Poziom testu (hermetyczny / integracyjny / E2E-smoke) i uzasadnienie zapisz w tabeli `tests.md` planu (gdy plan go ma; inaczej przy kroku w `steps.md`), nie w scenariuszu.

## Polityka techniczna
Zasada obowiązująca w całym systemie, której użytkownik nie opisuje osobno przy każdej historyjce, np. limit czasu i ponowienia wywołań zewnętrznych, idempotentność przetwarzania zdarzeń, walidacja konfiguracji przy starcie, jednolity format błędów. Każda: nazwa, 1–3 zdania, lista scenariuszy, które ją ilustrują. Zatwierdzasz ją raz; w sytuacjach awaryjnych nie piszesz osobnych scenariuszy biznesowych.

## Zatwierdzenie i aktualność
Zatwierdzenie to wpis człowieka w nagłówku `docs/scenarios/<obszar>.md`, w tym samym commicie co scenariusze:
```
<!-- Zatwierdzenie: <TICKET> · hist-3 · sc-3-1…sc-3-6 · <osoba> · <data> · źródło: <link, rewizja> -->
<!-- Zatwierdzenie: <TICKET> · polityki P1…P10 · <osoba> · <data> · źródło: <link, rewizja> -->
```
Przed zatwierdzeniem: `<!-- PROPOZYCJA — niezatwierdzone: <TICKET> · hist-3…hist-5 -->`. Zatwierdzenie obejmuje scenariusze we wszystkich trzech plikach. Scenariusze są na gałęzi zawsze aktualne (nie czekają na merge jak `/docs`). Aktualność pilnują: `sdlc-implement` (dopisuje nowe i zmienione `sc-X-Y`), `sdlc-docs` w trybie `zmiany` oraz `blind-test` (porównanie z commitem zatwierdzenia). Zmiana zatwierdzonego scenariusza wymaga nowego wpisu; bez niego `blind-test` zwraca `NIEWYSTARCZAJĄCY`.

## Ocena kompletności zadania (`blind-ready`)
Zadanie jest **GOTOWE**, gdy:
1. każdy scenariusz biznesowy ma stan początkowy, działanie, obserwowalny wynik, operacje zmieniające stan i zakazane skutki;
2. historyjki mają mało scenariuszy biznesowych (reguła „3–7”), a ścieżki jednego wejścia nie są pomieszane;
3. błędy z kontraktu biznesowego mają opisany wynik widoczny dla użytkownika (API, stan, zdarzenie);
4. określono właściciela danych i writerów (także z innych repo tej samej solucji), niezmienniki i zabronione skutki uboczne;
5. nowe nazwy (polecenia, pojęcia, statusy) nie kolidują z istniejącymi w zatwierdzonych scenariuszach i dokumentacji;
6. brak otwartych „WYMAGA DECYZJI”.

Gdy zadanie opisuje to w całości, `blind-ready` je przepuszcza bez generowania scenariuszy. Inaczej: **WYMAGA DOPRECYZOWANIA** + pytania do autora zadania (jedno zbiorcze pytanie). Każde pytanie ma format: **sytuacja** (konkretny przykład), **co zmienia decyzja**, **rekomendacja** (oznaczona jako propozycja). Przykładowa odpowiedź nigdy nie jest zatwierdzonym wymaganiem.

## Pokrycie polityką techniczną (`blind-plan`)
Dla zakresu planu **polityka techniczna** rozstrzyga: niedostępność lub timeout zależności, anulowanie, zamknięcie i restart procesu, duplikat, opóźnienie i kolejność zdarzeń, złe dane, wykrywanie awarii (sygnały, alerty, reakcja), przeszkody dla rollbacku — albo zapisano, że nie dotyczą, z powodem. Brak reguły: **dopisz politykę** (do zatwierdzenia), nie scenariusz biznesowy. Scenariusze techniczne generuje `blind-plan` z polityk i planu; `blind-ready` ich nie tworzy.

## Przegląd przez człowieka
Pokaż: opis historyjek, ich scenariusze biznesowe i politykę. Scenariuszy technicznych nie pokazuj do przeglądu pojedynczo; podaj tylko liczby i przypadki, których nie umiesz przypisać do polityki albo ścieżki głównej. Gdy historyjek jest kilka, podaj ich kolejność i zależności.

## Odkrycia podczas realizacji
Realna wartość z granicy systemu lub zależności (np. `null` w polu, które kontrakt API uznaje za obecne) to ścieżka systemu do rozstrzygnięcia. Sztuczny argument metody wewnętrznej, który nie dotrze tam z realnego przepływu, nie wymaga scenariusza; niemożliwość musi wynikać z kontraktu lub egzekwowanego niezmiennika, nie z założenia implementera. Zgłoszenie: **WYMAGA DECYZJI — BLOKUJE ZATWIERDZENIE**, opis ścieżki, warianty, wpływ (wynik, stan, działanie zewnętrzne, odzyskiwanie). Po decyzji: aktualizacja źródła, `docs/scenarios/` i `tests.md`.
