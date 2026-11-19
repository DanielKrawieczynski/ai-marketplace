# Scenariusze — <obszar>

<!-- Wzór pliku docs/scenarios/<obszar>.md; jeden plik na obszar (historyjki i scenariusze biznesowe).
     Polityka techniczna: policies.md, scenariusze techniczne: technical-cases.md (te same ID).
     Nazwy i ID wg references/terminology/<język>.md w sdlc-standards (tu hist-X, sc-X-Y).
     Historyjka ma jak najmniej scenariuszy biznesowych (zwykle 3–7); jedna ścieżka = jeden scenariusz.
     Numer nie zmienia znaczenia i nie jest używany ponownie; scenariusz wycofany oznacz „(wycofany)”.
     Test wskazuje pokrywany scenariusz identyfikatorem sc-X-Y w sposób przyjęty we frameworku (kategoria, tag, nazwa). -->

## hist-<X>. <nazwa>
**Jako** <rola> **chcę** <cel>, **żeby** <korzyść>.

Scenario: <opis biznesowy>
@sc-<X>-<Y>
Given <stan / dane>
When <wywołanie, np. GET /orders/{id}>
Then <oczekiwana odpowiedź lub efekt>
