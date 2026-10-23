# Przepływ pracy — szczegóły

## Wybór skilla
- Przed ogólnym przebiegiem (`sdlc-plan`, `sdlc-implement`, `sdlc-deliver`) przejrzyj listę skilli. Jeśli któryś jest wyspecjalizowany w zadaniu (migracja, wdrożenie, generator), użyj go zamiast ogólnego. Nie wiesz, czy pasuje — zapytaj.
- Dwa skille o tym samym przeznaczeniu (np. z różnych pluginów) — zapytaj, którego użyć.

## Zmiany kontraktów (API, eventy)
- **Rozszerzenie (non-breaking):** nie sprawdzaj konsumentów i nikogo nie informuj; informację po wdrożeniu przewiduje ticket.
- **Breaking change:** zapowiedź przed zmianą (często z prośbą o informację, kto i jak korzysta) powinien przewidywać ticket. Jeśli nie przewiduje, a zmiana wygląda na łamiącą, powiedz o tym użytkownikowi: mogłeś źle zrozumieć zadanie albo autor nie przewidział skutku.

## Inne repozytoria
- Zanim sięgniesz po repozytorium spoza bieżącego, zapytaj, czy użytkownik ma lokalną kopię i gdzie (odpowiedź obowiązuje do końca rozmowy); sprawdź `git -C <kopia> remote -v`.
- Kopię tylko czytaj: `git -C <kopia> fetch`, potem `git -C <kopia> show origin/<gałąź>:<ścieżka>`, `grep`, `ls-tree`. Gałąź domyślna: `git -C <kopia> symbolic-ref refs/remotes/origin/HEAD`. Zmieniaj ją tylko, gdy zadanie dotyczy tego repo (nowa gałąź).
- Bez kopii: `gh api repos/<właściciel>/<repo>/contents/<ścieżka>` albo płytki klon do katalogu tymczasowego poza repo.

## Frameworki i biblioteki
- API czytaj w wersji używanej w projekcie (kod zależności, dokumentacja tej wersji, changelog), nie z pamięci.
- Zanim zaplanujesz własne rozwiązanie albo nową zależność, sprawdź, czy robi to już framework lub istniejąca zależność. Funkcja dostępna dopiero w nowszej wersji — zaproponuj podbicie jako osobny krok.

## Wnioski do skilli
Gdy po drodze rozwiążesz nieoczywisty problem (pułapka, błędne założenie skilla), zaproponuj zapis wniosku we właściwym skillu albo w `org-standards`: objaw → przyczyna → rozwiązanie, bez sekretów.
