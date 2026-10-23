---
name: sdlc-plan
description: Plan zmiany przed implementacją (ticket, nowa funkcja, refaktoring lub nowy projekt), zapisany w /.vibe/plan/<TICKET>/. Użyj, gdy prosisz o zaplanowanie ticketu, funkcji lub nowego serwisu.
---

# Planowanie

Wynik: plan w `/.vibe/plan/<TICKET>/`, gotowy do implementacji. Ticket, gałąź, commity — `sdlc-standards`. Plan zawiera decyzje, nie kod.

## Tryb
| Tryb | Kiedy |
|------|-------|
| **zmiana** *(domyślny)* | jest ticket lub opis zmiany w istniejącym kodzie |
| **funkcja** | nowa lub złożona funkcja; nie wiadomo jeszcze co i gdzie — może wyjść nowy serwis |
| **greenfield** | nowy projekt od zera |

Nie podano trybu — zaproponuj jeden z jednozdaniowym uzasadnieniem. Dla `funkcja` i `greenfield` zacznij od `references/feature-and-greenfield.md`, potem krok 3.

## 1. Kontekst (czytaj minimalnie, równolegle)
- Ticket z Jiry: opis, kryteria akceptacji, podzadania, powiązane i epik — tylko te pola. Niedostępny — poproś o opis.
- Kod w obszarze zmiany oraz `/.vibe/` tylko w częściach dotykających zmiany: reguły biznesowe → `01-prd.md`, kontrakty → `02-api.md` / `03-consumers.md`, dane → `04-database.md`, konfiguracja → `05-configuration.md`, model → `07-domain-model.md`. Brak `/.vibe/` — zaproponuj `sdlc-init`, ale planuj dalej.
- Tylko gdy potrzebne: `../sdlc-standards/references/nfr.md` (kroki z `nfr-impact`), strony Confluence podlinkowane w tickecie (wyszukiwanie dopiero gdy ticket i kod nie wystarczają), skill `org-standards`.

## 2. Pytania i złożoność
- Zadaj **jedno zbiorcze pytanie**, tylko o to, co blokuje plan i nie wynika z kodu ani ticketu: cel i rezultat, właściciel i granice, wpływ na kontrakty / dane / konfigurację / integracje, ograniczenia (NFR, migracja, termin wydania), poza zakresem. Poczekaj na odpowiedź. Resztę niejasności zapisz jako założenia w `overview.md`.
- Oceń złożoność i uzasadnij w jednym zdaniu:

| Złożoność | Kiedy | Pliki planu |
|-----------|-------|-------------|
| **trivial** | 1–2 pliki, brak wpływu na kontrakty, dane i konfigurację | `overview.md`, `steps.md` |
| **simple** | jeden obszar, ograniczony wpływ | + `design.md` i `tests.md`, jeśli zmiana ich dotyczy |
| **complex** | wiele etapów, kontrakty, dane, zdarzenia, konfiguracja lub kilka modułów | wszystkie cztery |

- Dla **complex** (i **simple** ze zmianą API, zdarzeń lub integracji) wykonaj rozpoznanie wg `references/placement.md` i przedstaw rekomendację umiejscowienia. Wskazuje inny serwis niż bieżący albo wymaga uzgodnienia z innym zespołem — poczekaj na decyzję człowieka.

### Refaktoring
Zadanie bez nowej funkcjonalności: bez zmiany zachowania i kontraktów, każdy krok osobno budowalny i zielony. Pierwszy krok to testy dla kodu bez pokrycia. Problemy weź z analizy statycznej i duplikacji dla wskazanego obszaru (jeśli jest narzędzie) oraz z `../sdlc-standards/references/code-standards.md`; listę przedstaw przed planem.

## 3. Generowanie
Pliki, kroki i kontrola wg `references/plan-format.md`.

## Czego nie robić
- Nie generuj kodu, nie dodawaj funkcji spoza opisu, nie zmieniaj podziału odpowiedzialności między serwisami bez uzasadnienia.
- Nie proponuj nowego endpointu ani serwisu, jeśli istniejący już to robi — chyba że uzasadnisz, czemu nie pasuje.
- Nie planuj własnego rozwiązania ani nowej zależności tam, gdzie wystarcza framework lub istniejąca paczka.
- Nie pomijaj wpływu na testy, dokumentację, zdarzenia, NFR i kontrakty.
