# Role i granice informacji

Role realizuj w **odrębnych kontekstach** (podagenci; bez nich — osobne, ogłoszone fazy pracujące tylko na dozwolonych wejściach). Autor kodu nie recenzuje sam siebie.

| Rola | Kto | Widzi | Nie widzi / nie wolno |
|------|-----|-------|-----------------------|
| **Architekt** | agent prowadzący (Ty) | wszystko | pisać kodu i testów za role; zatwierdzać reguł biznesowych |
| **Tester UT** (RED) | `krawiec-sdlc:sdlc-tdd-tester` | brief, kod | implementować logikę |
| **Implementer** (GREEN) | `krawiec-sdlc:sdlc-tdd-implementer` | brief, kod, testy do uruchamiania | zmieniać testy UT **i testy scenariuszowe**; wybierać reguły biznesowe |
| **Refaktoryzator** | `krawiec-sdlc:sdlc-tdd-refactorer` | kod, testy | zmieniać zachowanie i asercje |
| **Tester scenariuszy** | `krawiec-blind-programmer:blind-scenario-tester` | scenariusze `tc-N`, publiczne kontrakty (OpenAPI, schematy zdarzeń), granice i fixture z planu, konwencje istniejących testów | kodu implementacji, diffu implementacyjnego i UT tej zmiany przed oddaniem własnych przypadków |
| **Recenzent** | `krawiec-blind-programmer:blind-reviewer` (+ `krawiec-sdlc:sdlc-reviewer` dla jakości kodu) | wg trybu (`tests`, `impl`, `audit`) | edytować pliki |
| **Test Ślepego Programisty** | skill `blind-test` | scenariusze, raporty, wyniki CI, metadane PR-a; kod i testy tylko do weryfikacji dowodów | oceniać poprawność i jakość implementacji |

Tester UT (TDD z `sdlc-implement-tdd`) i tester scenariuszy to dwie różne warstwy: pierwszy sprawdza lokalne reguły z briefu architekta, drugi — zachowanie na granicach aplikacji ze scenariuszy, niezależnie od kodu.

## Jednostka pracy
Krok lub PR z `steps.md` (mały, spójny wycinek funkcjonalny). Grupowanie pracy nie scala dowodów: wynik jest mapowany do każdego `tc-N`.

## Bramki architekta (dodatkowe do `architect-gates.md` z `sdlc-implement-tdd`)
1. **Plan i kontrakt:** scenariusze zatwierdzone przez człowieka, brak otwartych decyzji; dobór poziomów (UT dla lokalnych reguł; hermetyczne od endpointu do skutku; integracyjne dla SQL, brokera, API; E2E/smoke reprezentatywnie, bez powielania niższych poziomów).
2. **Propozycja testów scenariuszowych** (przed implementacją, dla istotnego zachowania): mapowanie do `tc-N`, dane, obserwowalny wynik, także skutki zabronione, adekwatność poziomu. Odrzuć test wymagający nieuzgodnionego zachowania lub API wymyślonego przez testera. Test, który nie kompiluje się przez nieistniejącą klasę, nie jest wartościowym RED — popraw test albo uzgodnij granicę.
3. **RED testów scenariuszowych:** build przechodzi, testy padają z powodu braku zachowania (asercja / „not implemented”), nie błędu setupu.
4. **GREEN i REFACTOR:** jak w `architect-gates.md`; sumy kontrolne (`git hash-object`) obejmują też testy scenariuszowe.

## Rozbieżność
Test scenariuszowy pada → tester przekazuje: `tc-N`, wejście, oczekiwany i rzeczywisty wynik, commit, konfigurację. Implementer klasyfikuje: implementacja / test lub harness / niejasny scenariusz / konfiguracja lub zależność. Architekt rozstrzyga technicznie; kwestia biznesowa wraca do człowieka. Oczekiwanego wyniku nie zmienia się bez śladu decyzji.

## Testy z tożsamością
Test aplikacji może wstrzyknąć tożsamość i claimsy testowym handlerem, by sprawdzić autoryzację endpointu; nie dowodzi to poprawnej walidacji tokena przez produkcyjny middleware — zapisz jako ograniczenie dowodu. Scenariusze autoryzacji po claimach obejmują brak i błędny claim; mock IdP tylko wtedy, gdy walidacja tokena jest przedmiotem scenariusza.

## Bezpieczeństwo testów
Testy i probe'y nie powodują niekontrolowanych zmian stanu biznesowego; nie używaj produkcji; dane testowe z izolacją i sprzątaniem.
