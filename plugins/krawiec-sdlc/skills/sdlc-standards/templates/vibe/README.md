# /.vibe — dokumentacja dla agentów

Mapa systemu i reguły, których nie widać w kodzie. To nie kopia kodu: bez list endpointów, pól, kolumn i kluczy konfiguracji — agent czyta je z kodu, a kopie szybko się dezaktualizują.

- Opisuj stan faktyczny, także dla legacy. Bez wymyślonych elementów, przykładowych danych i placeholderów; czego nie wiadomo — `TODO`.
- Linkuj do kodu (`[Klasa](ścieżka/do/pliku)`), zamiast go opisywać.
- Aktualizuj tylko wtedy, gdy zmiana dodaje obszar w kodzie, wprowadza regułę lub konwencję, albo zmienia model domenowy.

| Plik | Tworzyć, gdy |
|------|--------------|
| `01-prd.md` | zawsze |
| `02-api.md` | serwis udostępnia API |
| `03-consumers.md` | serwis konsumuje zdarzenia lub wiadomości |
| `04-database.md` | serwis używa bazy |
| `05-configuration.md` | zawsze |
| `06-deployment.md` | zawsze |
| `07-domain-model.md` | zawsze |
| `plan/<TICKET>/` | planowana jest zmiana (`sdlc-plan`) |
