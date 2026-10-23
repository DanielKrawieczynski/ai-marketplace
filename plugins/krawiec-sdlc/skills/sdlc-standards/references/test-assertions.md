# Asercje w testach

Cel: błąd testu mówi **które pole**, **jaka wartość oczekiwana** i **jaka faktyczna**, bez debugowania. Wynik ma pokazywać **wszystkie istotne nieprawidłowości naraz**, a nie tylko pierwszą — inaczej poprawiasz, uruchamiasz i odkrywasz kolejny błąd pięć razy. Użyj idiomu frameworka z repo.

## Zasady
- Jedna asercja na pole, z matcherem pokazującym expected i actual.
- Wartość oczekiwana pochodzi z danych wejściowych testu, nie z literału przepisanego ręcznie.
- Powiązane pola w jednej grupie asercji (soft assertions / multiple scope). Gdy framework tego nie ma — zbierz różnice w listę i zgłoś jedną porażką.
- Wiele pól to porównanie całych obiektów lub kolekcji z raportem różnic, a nie `Equals` zwracający `false`.
- Asercja, od której zależą pozostałe (obiekt nie jest `null`, kolekcja ma elementy), idzie przed grupą i przerywa test.
- Komunikat tam, gdzie matcher nie mówi, co sprawdzasz (np. asercja na `true`).
- JSON parsuj i porównuj właściwości, nie stringi. Daty i liczby zmiennoprzecinkowe z tolerancją. Powtarzalne walidacje w helperach.

## Unikaj
| Problem | Zamiast tego |
|---------|--------------|
| kilka warunków w jednej asercji (`&&`) | osobna asercja na pole |
| komunikat bez wartości („condition failed”) | matcher frameworka |
| własny silnik asercji, własne wyjątki, połykanie wyjątków | asercje frameworka |
| asercje odkładane do lambd wykonywanych później | asercje tam, gdzie jest wynik |
| `.equals(...)`, ręczne zliczanie, `any(k => k == x)` | matchery: równość, pustość, zawieranie |
| `First(...)` lub `!` na oczekiwanych danych (wyjątek zamiast porażki) | asercja „not null” lub dopasowanie elementu, potem pola |
| magiczne timeouty | nazwane stałe |
| asercja na wyrażeniu `a < b` | matcher porównania |
