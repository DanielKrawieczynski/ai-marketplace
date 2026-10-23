---
name: sdlc-adr
description: Zapis ważnej decyzji architektonicznej lub technologicznej (ADR) z kontekstem, alternatywami i konsekwencjami. Użyj przy wyborze technologii spoza standardu, decyzji o długich skutkach lub po spike'u.
---

# ADR

Zapisujesz decyzję w `docs/adr.md` albo `docs/adr/`.

## Kiedy
Wybór technologii spoza przyjętego stosu (sprawdź wykaz zatwierdzonych technologii, jeśli zespół go ma); decyzja z długimi konsekwencjami; odrzucenie standardowego podejścia; zakończony spike z rekomendacją do trwałego zapisu. **Nie** dla rutynowych decyzji implementacyjnych.

## Wejście
Od użytkownika: temat, rozważane opcje, wybrana opcja i powód. Z repo: stos z kodu i `/.vibe/`, istniejące ADR (`docs/adr.md`), decyzje i standardy w Confluence (`atlassian`) i `org-standards` — nowy ADR im nie przeczy bez jawnego odniesienia.

## Zasady
- Nie zmieniaj treści zatwierdzonych ADR — dodaj nowy, który je zastępuje (status poprzedniego: „Zastąpiony przez ADR-NNN”).
- Nie zapisuj decyzji bez uzasadnienia odrzuconych alternatyw.

## Gdzie
Numer: kolejny `ADR-NNN` po wpisach w `docs/adr.md` (brak pliku — utwórz z `../sdlc-standards/templates/docs/adr.md`).
- Decyzja mieści się w 2–5 zdaniach (czego używamy, do czego, dlaczego) → wpis w `docs/adr.md` wg szablonu.
- Wymaga więcej (kilka opcji, rozbudowane skutki) → osobny `docs/adr/NNN-krotka-nazwa.md`, a w `docs/adr.md` krótki wpis (tytuł, status, decyzja w 1–2 zdaniach) z linkiem.

## Struktura pełnego ADR
```markdown
# ADR-NNN: <tytuł — decyzja w jednej linii>

**Data:** YYYY-MM-DD
**Status:** Proponowany | Zaakceptowany | Odrzucony | Zdeprecjonowany | Zastąpiony przez ADR-NNN
**Autorzy:** <imię lub „AI + <imię recenzenta>”>
**Zastępuje:** ADR-NNN lub —
**Powiązane:** spike, ticket, PRD lub —

## Kontekst
## Rozważane opcje
## Decyzja
## Konsekwencje
### Pozytywne
### Negatywne i kompromisy
### Wymagane działania
- [ ] ...
```

## Po zapisaniu
Decyzja zmienia standardy zespołu lub stos — zaproponuj aktualizację `sdlc-standards` albo `org-standards`. Commit wg `sdlc-standards` (`ADR-NNN: <tytuł>`).
