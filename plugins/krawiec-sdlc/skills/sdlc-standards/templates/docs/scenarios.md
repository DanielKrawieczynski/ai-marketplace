# Scenariusze — <obszar>

<!-- Wzór pliku docs/scenarios/<obszar>.md; jeden plik na obszar.
     Numeracja tc-N ciągła w repo; numer nie zmienia znaczenia; scenariusz wycofany oznacz „(wycofany)” i nie używaj numeru ponownie.
     Ścieżki: szczęśliwa, negatywne (walidacja, 404, 401 / 403), kończące się wyjątkiem — gdy uzasadnione.
     Test wskazuje pokrywany scenariusz identyfikatorem tc-N w sposób przyjęty we frameworku (kategoria, tag, nazwa). -->

Scenario: <opis biznesowy>
@tc-<N>
Given <stan / dane>
When <wywołanie, np. GET /orders/{id}>
Then <oczekiwana odpowiedź lub efekt>
