---
name: org-standards
description: Standardy organizacji dla pracy z kodem — praktyki inżynierskie (DoD, zależności, dane, logowanie, monitoring), projektowanie API, proces QA i testy, code review. Użyj razem z sdlc-plan, sdlc-implement, sdlc-review i przy pytaniach o standardy organizacji.
---

# Standardy organizacji

Reguły organizacji mają pierwszeństwo przed domyślnymi z `sdlc-standards`. Czytaj wyłącznie pliki, których „Kiedy” pasuje do zadania. Sprzeczność z ticketem lub konwencją repo zgłoś użytkownikowi.

| Plik w `references/` | Zawartość | Kiedy |
|----------------------|-----------|-------|
| `engineering-practices.md` | odstępstwa, DoD, wydanie na produkcję, dobre praktyki, podatności, dane i transakcje, logowanie, monitoring | plan, implementacja, review, zmiany w bazie |
| `api-design.md` | endpointy, kody HTTP, klienci HTTP, autoryzacja, integracje zewnętrzne, OpenAPI | zmiany API, review |
| `qa-process.md` | testy jednostkowe i automatyczne, proces QA, smoke, wydajnościowe | implementacja, TDD, testy |
| `code-review.md` | zasady code review | review |
| `architecture.md` | diagramy (powiązania, komponenty), nazewnictwo, wybór technologii, opis aplikacji w repo | plan (nowa funkcja lub serwis), init, ADR |
| `messaging-and-dependencies.md` | zdarzenia i rozkazy, konfiguracja, słowniki, health checki | eventy, kolejki, integracje, konfiguracja |
| `coding-guidelines.md` | nazewnictwo i organizacja, abstrakcje i wyjątki, daty i czas, baza danych, metody asynchroniczne (.NET) | implementacja, review, refaktoring |
| `frontend.md` | review, testy jednostkowe, wydajność, analiza statyczna, podatności, monorepo, sesja i SSO, CSRF | praca z aplikacją frontendową |
| `operational-requirements.md` | ciągłość działania, sieć, sekrety, README operacyjne, konfiguracja i wdrożenie, SLO | plan, review (NFR), wdrożenie |
| `security-requirements.md` | wymagania bezpieczeństwa backendu i frontendu z priorytetami | plan, review (security), implementacja |
