# Tryb security

Wynik: lista problemów bezpieczeństwa z oceną ryzyka i poprawkami (`../../sdlc-standards/references/review-report-format.md`). Poprawiasz po akceptacji raportu. Jeśli jest skill `org-standards`, sprawdź też jego wymagania bezpieczeństwa; zestawienie wymagań na końcu wg `../../sdlc-standards/references/nfr.md`.

Przejrzyj tylko to, czego dotyczy diff.

- **S1 Sekrety i konfiguracja:** sekrety (hasła, tokeny, klucze, connection stringi z hasłem) wyłącznie poza repo — nie w kodzie ani plikach konfiguracji; brak sekretów w logach.
- **S2 Uwierzytelnianie i autoryzacja:** chronione endpointy mają autoryzację, publiczne są jawne i uzasadnione; Basic Auth z porównaniem w stałym czasie; weryfikacja podpisów webhooków (HMAC); role i polityki bez zbyt szerokich uprawnień; sprawdzanie własności zasobu (IDOR).
- **S3 Dane wejściowe:** walidacja modeli, ścieżki i query; brak niekontrolowanej deserializacji; limit rozmiaru requestu.
- **S4 SQL i dane:** zapytania parametryzowane, brak sklejania SQL z danych użytkownika; least privilege użytkownika bazy; bez zbędnych danych wrażliwych w odpowiedziach.
- **S5 Integracje:** timeouty wszystkich wywołań; retry z backoffem; walidacja certyfikatów TLS.
- **S6 Zdarzenia i kolejki:** idempotentni konsumenci; brak PII w payloadach bez potrzeby; skonfigurowana i monitorowana DLQ; zabezpieczone endpointy zarządzania brokerem.
- **S7 Logowanie:** brak PII bez maskowania, brak credentials i tokenów, stack trace na właściwym poziomie, propagacja correlation ID.
- **S8 Wdrożenie:** kontenery nie jako root; brak sekretów w Dockerfile; endpoint health nie ujawnia danych wrażliwych; poprawne probe'y.
