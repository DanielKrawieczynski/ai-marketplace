# Standardy kodu

Konwencje repo wygrywają. To jest ogólne minimum.

- **I/O i współbieżność:** nie blokuj wątku w kodzie asynchronicznym; zasoby zwalniaj deterministycznie (`using`, `try-with-resources`, `defer`).
- **Błędy:** łap na poziomie, który umie je obsłużyć; nie połykaj (pusty `catch`); loguj z kontekstem (serwis, identyfikator, kod odpowiedzi); błąd konsumenta zaloguj przed retry lub DLQ.
- **Konfiguracja:** z mechanizmu konfiguracji lub zmiennych środowiskowych, bez hardcodowania; sekrety poza repo.
- **Dane:** SQL wyłącznie parametryzowany; listy z API z paginacją; zmiany schematu przez migracje.
- **Kolejki i eventy:** konsumenci idempotentni; błąd przetwarzania nie gubi wiadomości (DLQ / poison message); retry tylko razem z tą strategią.
- **Zasoby i pamięć:** klienci HTTP i połączenia współdzielone, nie tworzone per wywołanie; cache i kolekcje w singletonach z limitem lub wygasaniem; subskrypcje, timery i zadania w tle z odpinaniem; w DI zależność o krótszym życiu nie trafia do dłużej żyjącej.
- **Bezpieczeństwo:** chronione endpointy z autoryzacją (publiczne jawnie i z uzasadnieniem); bez PII, haseł i tokenów w logach, wyjątkach i odpowiedziach błędów.
- **Zależności:** nowa tylko z uzasadnieniem; najpierw to, co daje framework lub istniejące paczki.
- **Nazwy testów:** `<Co>_<Sytuacja>_<Skutek>` — co testujemy (metoda; endpoint w testach API; zdarzenie lub akcja biznesowa w testach konsumenta), w jakiej sytuacji (`When…`, dopuszczalne `Given…` / `If…`), z jakim skutkiem (`Should…`), np. `GetOffer_WhenIdDoesNotExist_ShouldReturn404`. Dopasuj do idiomu języka i konwencji repo; układ Arrange / Act / Assert; asercje — `test-assertions.md`.
