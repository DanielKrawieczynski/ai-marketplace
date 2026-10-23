---
name: sdlc-deliver
description: Cały ticket end-to-end małymi PR-ami — plan, a dla każdego PR implementacja, review z poprawkami, dokumentacja i Pull Request, z punktami kontrolnymi. Użyj przy „dowieź / zrób ticket X” lub prośbie o cały proces od planu do PR.
---

# Dowiezienie ticketu

Prowadzisz przez cały proces, wywołując kolejne skille wg ich `SKILL.md`, z odstępstwami niżej.

## Tryby
| Tryb | Zatrzymanie i czekanie na człowieka |
|------|-------------------------------------|
| **standard** *(domyślny)* | po planie i przed utworzeniem każdego PR |
| **auto** | tylko przed utworzeniem każdego PR |

W obu trybach stój też, gdy: wymagania są niejasne albo ticket przeczy kodowi lub Confluence; potrzebna jest decyzja architektoniczna (`sdlc-adr`), breaking change poza ticketem albo zmiana poza zakresem planu; build lub testy nie przechodzą po 3 próbach naprawy.

## 0. Przygotowanie
- Ustal `<TICKET>` i pobierz ticket z Jiry.
- Jest skill wyspecjalizowany w tym rodzaju zadania (`workflow.md` → „Wybór skilla”) — powierz mu kroki 1–2, a review, dokumentację i PR prowadź dalej tak jak tutaj.
- Na gałęzi bazowej utwórz gałąź wg `sdlc-standards`. **Zadaj pytanie o commity** (także w trybie auto) — odpowiedź obowiązuje w całym przebiegu.
- Brak `/.vibe/` (sam `plan/` się nie liczy): ostrzeż, że plan i implementacja będą mniej trafne, zaproponuj `sdlc-init`; odmowa — kontynuuj.

## 1. Plan — `sdlc-plan`
- W trybie auto pytaj tylko o to, co blokuje plan; resztę zapisz jako założenia w `overview.md`.
- Zacommituj plan. W trybie standard pokaż podsumowanie (złożoność, PR-y, ryzyka, założenia) i czekaj na akceptację.
- Plan ma kilka PR-ów — zapytaj raz, jak budować kolejne gałęzie: na poprzedniej (domyślnie, bez czekania na merge) czy od bazowej po merge poprzedniego.

## 2–5. Dla każdego PR z `steps.md`, w kolejności wdrożenia
Niezależne PR-y mogą iść równolegle u podagentów (`sdlc-implement` → „PR-y i równoległość”; pytanie raz, także w trybie auto).

2. **Implementacja** — `sdlc-implement` (albo `sdlc-implement-tdd` na prośbę o TDD): kroki PR bez pytania o każdy z nich; „akceptacja ręczna” z planu to punkt kontrolny.
3. **Review** — `sdlc-review` zmian tego PR (standard; security i nfr przy krokach z `nfr-impact`). Krytyczne i istotne problemy napraw od razu, bez czekania na akceptację raportu (wyjątek od zasady skilla), zacommituj, powtórz review zmienionych miejsc — maksymalnie 2 rundy, resztę przenieś do opisu PR. Build, testy i analiza z ostatniej rundy dla bieżącego HEAD są wynikiem PR — nie powtarzaj ich w kroku 5.
4. **Dokumentacja** — `sdlc-docs` (tryb `zmiany`), commit.
5. **Pull Request** — `sdlc-pr`; zawsze punkt kontrolny: pokaż podsumowanie i treść, czekaj na zgodę przed push i utworzeniem PR. Potem następny PR.

## Podsumowanie końcowe
Linki do PR-ów · lista commitów · wynik build, testów i quality gate (jeśli była analiza) · „Zestawienie” NFR i security (`../sdlc-standards/references/nfr.md`), jeśli zmiana go dotyczy · założenia przyjęte bez potwierdzenia · problemy przeniesione do PR i rzeczy do ręcznej weryfikacji.
