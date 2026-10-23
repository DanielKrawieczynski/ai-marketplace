# Zasady testowania

Dopasuj do stosu i konwencji repo (biblioteka mocków, buildery danych, struktura folderów). Nazwy i asercje: `../../sdlc-standards/references/code-standards.md` i `test-assertions.md`. Zawsze pokryj ścieżki błędów i przypadki brzegowe.

## Testy jednostkowe
Dla serwisów domenowych i aplikacyjnych, walidatorów, mapperów, transformacji i metod z logiką warunkową. Izoluj od zewnętrznych zależności, mockuj tym, co jest w projekcie testowym.

## Konsumenci kolejek
Dla każdego konsumenta z planu lub `/.vibe/03-consumers.md`: poprawne przetworzenie, błąd przetwarzania nie gubi wiadomości (retry / DLQ), idempotentność (duplikat). Domyślnie testuj klasę konsumenta bezpośrednio — instancja z mockami, wywołanie metody obsługi — jak istniejące testy. Harnessu brokera (in-memory) użyj tylko wtedy, gdy test wymaga potoku (filtry, middleware, routing); wersję API dopasuj do biblioteki w projekcie.

## Endpointy API
Dla endpointów z `/.vibe/02-api.md`: happy path, walidacja wejścia (400), autoryzacja (401, a przy rolach 403), nieistniejący zasób (404).

## Podsumowanie
Podaj liczbę testów, pokryte ścieżki i przypadki, których nie dało się napisać bez dodatkowego kontekstu.
