# Kroki implementacji

## Etapy
Małe etapy, każdy to jeden PR do osobnego wdrożenia (najpierw kontrakt zgodny wstecz, nowa funkcja za flagą, migracja przed kodem). Etap należy do jednej historyjki. Kamień milowy, jeśli potrzebny, to znacznik na liście historyjek (np. „do tej historyjki to wersja minimum”).

| Etap | Historyjka | Kroki | Wymaga wcześniej wdrożonego |
|------|------------|-------|-----------------------------|

## Kroki

### 1.1 (nazwa)
- Co: (co robimy)
- Zależy od: (— / numery kroków)
- Plan: (plik i sekcja: np. `design.md` → Dane)
- Pliki: (do zmiany)
- Testy: (`sc-X-Y` lub co dodać)
- Migracja: tak / nie · nfr-impact: tak / nie (opis)
- Akceptacja ręczna: nie / tak — (kiedy i czego)

## Zależności i równoległość
(Łańcuch główny, np. `1.2 → 2.1 → 3.1`, i kroki niezależne do równoległej realizacji.)

## Dokumentacja do aktualizacji
(Pliki `docs/` i `.vibe/` po implementacji.)
