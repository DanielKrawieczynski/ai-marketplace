# Wymagania niefunkcjonalne (NFR)

Wymagania projektu bierz z ticketu, `/.vibe/01-prd.md`, dokumentacji repo lub od użytkownika. Poniższa lista to minimum, gdy projekt nie ma własnych. Wymaganie może nie dotyczyć aplikacji — oceń, nie zakładaj. Zmiana nie może pogorszyć spełnionego wymagania.

## Wydajność i skalowalność
- bez zapytań N+1; streaming lub paginacja dla dużych danych; indeksy dla nowych zapytań,
- współdzieleni klienci HTTP, limity współbieżności dla intensywnych konsumentów,
- cele czasu odpowiedzi z SLO, jeśli są.

## Odporność
- jawne timeouty HTTP, bazy i integracji; retry z backoffem, jitterem i limitem prób,
- circuit breaker tam, gdzie awaria zależności mogłaby kaskadowo zablokować serwis; graceful degradation,
- migracje bazy transakcyjne i z timeoutami; krótkie połączenia do bazy.

## Obserwowalność
- logi strukturalne z correlation ID, stack trace na ERROR, start i stop konsumentów,
- endpointy health (liveness, readiness),
- metryki operacji kluczowych, błędów i zależności.

## Konfiguracja
- timeouty, limity i retry konfigurowalne; konfiguracja produkcyjna spoza repo; fail-fast przy braku wymaganej konfiguracji,
- feature flags dla ryzykownych funkcji.

## Wdrożenie
- limity zasobów, probe'y, rolling update, graceful shutdown (SIGTERM), proces w kontenerze nie jako root.

## Zestawienie
Na koniec review `nfr` / `security` i w podsumowaniu `sdlc-deliver` — tabela dla wymagań, których dotyczy zmiana:

| Wymaganie | Po zmianie: spełnione / niespełnione / nie dotyczy | Uzasadnienie |
|-----------|-----------------------------------------------------|--------------|
