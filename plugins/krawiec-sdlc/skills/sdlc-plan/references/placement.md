# Umiejscowienie zmiany

Cel: ustalić, **gdzie** zrobić zmianę i **z czego skorzystać**, zanim powstanie plan. Źródła od najpewniejszego: kod repo, `/.vibe/` i `/docs/`, ticket, kod innych repozytoriów (`workflow.md` → „Inne repozytoria”), katalog usług, jeśli jest dostępny (MCP lub plik w repo). Katalog traktuj jak cache: prawdą jest kod, rozbieżność zgłoś. Brak katalogu — zaznacz w `overview.md`, że rozpoznanie oparto na kodzie.

| Sytuacja | Zakres |
|----------|--------|
| zmiana trivial | pomiń |
| zmiana simple | tylko K4, przy łamiącej zmianie API lub zdarzeń |
| zmiana complex, funkcja, greenfield | K1–K5 |

**K1. Bieżący serwis.** Moduły, udostępniane i konsumowane API i zdarzenia, zależności (baza, kolejki, inne serwisy). Zweryfikuj w kodzie w zakresie zmiany; rozbieżności z dokumentacją to luki.

**K2. Kandydaci.** Wypisz z ticketu potrzebne zdolności (np. „odczyt zgód”, „wysyłka maila”). Dla każdej poszukaj istniejącego wykonawcy w kodzie, dokumentacji, katalogu (po polsku i po angielsku — dopasowanie bywa dosłowne) i w ADR. Sprawdź, czego serwis świadomie **nie** robi — wyklucza fałszywych kandydatów i pokazuje, kiedy potrzebne są dwa serwisy. Komponenty deprecated lub eksperymentalne tylko z ostrzeżeniem.

**K3. Kontrakty.** Dla wybranych kandydatów ustal z definicji (OpenAPI / AsyncAPI, kod) konkretne endpointy i zdarzenia: ścieżka, metoda, modele, autoryzacja. Nie wymyślaj; czego definicja nie zawiera — pytanie otwarte. Nie wklejaj całych specyfikacji.

**K4. Konsumenci.** Tylko przy łamiącej zmianie API bieżącego serwisu: wypisz znanych konsumentów i ich właścicieli (katalog, dokumentacja, wyszukiwanie w innych repo) jako wsparcie zapowiedzi. Rozszerzenie kontraktu — pomiń.

**K5. Rekomendacja** (przedstaw przed generowaniem planu):
```
Umiejscowienie: <serwis / moduł> (repo, zespół) — co zmieniamy i dlaczego tu
Odrzucone: <serwis> — powód
Wykorzystane API / zdarzenia: <nazwa> — <metoda ścieżka / zdarzenie> — po co
Konsumenci zmienianych kontraktów: <API>: <konsument (zespół)>
Luki: czego nie udało się potwierdzić
```
Rekomendacja nie przesądza decyzji; przy zmianie w cudzym serwisie lub nowym kontrakcie wskaż zespół do uzgodnienia i poczekaj na akceptację.

**Wynik w planie:** `overview.md` → „Umiejscowienie zmiany”; `design.md` → Integracje (K3) i API (K4); kroki do uzgodnienia — „Akceptacja ręczna: tak”.
