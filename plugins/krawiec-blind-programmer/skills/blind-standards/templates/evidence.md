# Dowody i ryzyka — <TICKET>

<!-- Plik planu obok overview/design/tests/steps. Tylko sekcje, których zmiana dotyczy; pominięta sekcja = jedno zdanie „nie dotyczy, bo …”. Nie wymyślaj reguł biznesowych: luka → „WYMAGA DECYZJI” + pytanie. -->

## Scenariusze
Źródło: <link, rewizja/data odczytu> · Plik: `docs/scenarios/<obszar>.md` (zatwierdzenie: wpis człowieka w nagłówku tego pliku)

## Własność danych
Właściciel: <usługa>. Inni writerzy (także z innych repo tej solucji): <lista albo „brak — założenie zakresu”>.

## Techniczne ścieżki niepowodzenia (TSP-07)
| Zależność / operacja | Awaria (niedostępność, timeout, przerwanie, anulowanie, zamknięcie procesu) | Wynik dla wywołującego | Praca w toku | Retry / kompensacja | Sygnał / alert | Decyzja |
|---|---|---|---|---|---|---|

## Zdarzenia (TSP-08)
| Zdarzenie | Duplikat | Opóźnienie | Zmiana kolejności | Ponowienie | Oczekiwany rezultat | tc-N |
|---|---|---|---|---|---|---|

## Dane i złe dane (TSP-09)
Niezmienniki · stany dopuszczalne / niedozwolone / do naprawy (uwzględnij granice transakcji, współbieżność, retry, punkty przerwania) · rozpoznanie złych danych i reakcja (odrzucić / naprawić / kwarantanna / zgłosić) · zabronione skutki uboczne.

## Obserwowalność i reakcja
| Warunek awarii | Sygnały (metryki, logi, ślady) | Alert (próg, okno, pilność, odbiorca, działanie) lub jak wykryjemy | Dashboard (czy potrzebny) | Dowód działania / ograniczenie sprawdzenia |
|---|---|---|---|---|

## Rollback
Co utrudnia (migracje, nieodwracalne dane, działania zewnętrzne); ocena bezpieczeństwa automatycznego rollbacku: <jest / brak → zatrzymanie rollout i eskalacja>.

## Pochodzenie testów scenariuszowych
Tester: <typ agenta, kontekst rozdzielony od implementera: tak / nie> · Dostał: <pliki> · Nie dostał: implementacja, diff, UT · Commit bazowy: <sha> · Sumy `git hash-object` testów po RED: <plik: suma>

## Otwarte decyzje
<WYMAGA DECYZJI — BLOKUJE ZATWIERDZENIE: opis, warianty, wpływ — albo „brak”>
