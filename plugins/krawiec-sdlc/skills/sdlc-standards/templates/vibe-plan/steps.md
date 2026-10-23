# Kroki implementacji

## PR-y
Małe PR-y, każdy do osobnego wdrożenia (najpierw kontrakt zgodny wstecz, nowa funkcja za flagą, migracja przed kodem).

| PR | Kroki | Wymaga wcześniej wdrożonego |
|----|-------|-----------------------------|

## Kroki

### 1.1 (nazwa)
- Co: (co robimy)
- Zależy od: (— / numery kroków)
- Plan: (plik i sekcja: np. `design.md` → Dane)
- Pliki: (do zmiany)
- Testy: (`tc-N` lub co dodać)
- Migracja: tak / nie · nfr-impact: tak / nie (opis)
- Akceptacja ręczna: nie / tak — (kiedy i czego)

## Zależności i równoległość
(Łańcuch główny, np. `1.2 → 2.1 → 3.1`, i kroki niezależne do równoległej realizacji.)

## Dokumentacja do aktualizacji
(Pliki `docs/` i `.vibe/` po implementacji.)
