# Format raportu (review, weryfikacja)

1. **Podsumowanie** — 3–5 zdań: co przeanalizowano i jaki jest stan.
2. **Krytyczne 🔴** — blokują merge lub wdrożenie.
3. **Istotne 🟡** — nie blokują, obniżają jakość; naprawić wkrótce.
4. **Braki i dług 🔵** — dokumentacja, testy, obserwacje długoterminowe.
5. **Rekomendacje ✅** — co działa dobrze i opcjonalne usprawnienia.

Pozycja w 2–4: `ścieżka:linia` — problem — ryzyko — poprawka (kod lub krótki opis). Pusta sekcja: „brak”. Bez powtarzania kodu, który jest w diffie.
