# Kryteria Testu Ślepego Programisty (TSP)

Każde kryterium oceniaj osobno; `NOT_APPLICABLE` tylko z uzasadnieniem i zatwierdzeniem człowieka.

| ID | Kryterium | Wymagany dowód |
|----|-----------|----------------|
| TSP-01 | UT przechodzą, mają uzgodnione pokrycie i raport mutacji; test-first dla istotnego zachowania, a przy odstępstwie — niezależne review UT | wynik UT; pokrycie z zakresem i mianownikiem; raport mutacji + uzasadnienie istotnych przetrwałych mutantów; dla test-first: test był czerwony z powodu braku zachowania, potem zielony; przy odstępstwie: uzasadnienie i review UT. UT ocenia się względem lokalnych reguł i sensu asercji; nie wymaga się mechanicznego mapowania UT do ID `tc-N` |
| TSP-02 | Niezależny tester zweryfikował scenariusze integracyjne/E2E, w tym istotne błędy techniczne | wyniki testów, pokrycie gałęzi z zakresem i mianownikiem, powiązanie z ID scenariuszy |
| TSP-03 | Quality Gate analizy statycznej (np. SonarQube) zielony | wynik bramki dla tego PR-a |
| TSP-04 | Aplikacja gotowa na orkiestrator (np. AKS), zależności osiągalne | probe'y startup/readiness/liveness, status wdrożenia, liczba nieoczekiwanych restartów; liveness bez zależności zewnętrznych |
| TSP-05 | Każdy scenariusz ma dowód z adekwatnego poziomu, a zgodność ze scenariuszem ocenił niezależny aktor | macierz `ID → poziom → test → oczekiwany wynik → wynik`; kontrola kompletności dla commita; niezależna opinia o sensie asercji i o nowych ścieżkach domenowych; widoczne uzasadnienie doboru poziomów |
| TSP-06 | Build ostatniego commita PR-a działa na preprodukcji i przechodzi kontrole | wynik wdrożenia, smoke/E2E, probe'y i stan środowiska dla artefaktu z tego commita (digest) |
| TSP-07 | Techniczne ścieżki niepowodzenia zmienionego przepływu mają reakcję i obserwowalność | zachowanie przy niedostępności/timeoucie zależności, przerwaniu, anulowaniu, zamknięciu procesu; wynik dla wywołującego, praca w toku, retry/kompensacja; sygnały; dla awarii wymagających szybkiej reakcji alert (warunek, okno, pilność, odbiorca, działanie); dowód działania alertu albo jawne ograniczenie sprawdzenia. Dashboard tylko gdy potrzebny, nie zastępuje alertu |
| TSP-08 | Zachowanie dla opóźnionych, zduplikowanych i nieuporządkowanych zdarzeń | oczekiwane rezultaty i testy dla przypadków istotnych dla zmiany; uzasadnione wyłączenia |
| TSP-09 | Spójność danych i obsługa złych danych | niezmienniki, wykrywanie naruszeń, reakcja, testy (np. brak publikacji zdarzenia z wymaganym polem `null`); właściciel danych i wszyscy writerzy wskazani |

## Progi
Nie wymyślaj progów. Kolejność: konfiguracja repo / ADR / org-standards → uzgodniony kierunek: pokrycie UT **powyżej 90%**, pokrycie gałęzi testów niezależnych **bliskie 100%** (to kierunki, nie twarde progi) → próg mutacji, alarmów i rollbacku jest decyzją zespołu: gdy brak, zapytaj i oznacz „próg nieustalony” w raporcie.

## Ocena asercji
Samo istnienie `assert` nie zalicza scenariusza. Test musi sprawdzać obserwowalny skutek: odpowiedź API, stan danych, liczbę opublikowanych zdarzeń, reakcję na błąd, **także skutki, które nie mogą wystąpić** (np. brak drugiego zdarzenia).

## Rollback
Automatyczny rollback wymaga pozytywnej, udokumentowanej oceny zgodności poprzedniej wersji ze schematem i stanem danych oraz wpływem działań zewnętrznych. Bez niej: zatrzymaj rollout i eskaluj.

## Co nie jest wymagane
Scenariusz dla każdej gałęzi kodu, dla wejścia niemożliwego na granicy systemu (niemożliwość musi wynikać z kontraktu lub egzekwowanego niezmiennika, nie z założenia implementera), test każdego scenariusza na każdym poziomie, dashboard dla każdej zmiany, konkretne narzędzie (Grafana, Kibana, SonarQube — liczy się równoważny dowód).
