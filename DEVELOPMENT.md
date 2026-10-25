# Rozwój — notatki techniczne

## Układ

```
.claude-plugin/marketplace.json   # Claude Code
.github/plugin/marketplace.json   # GitHub Copilot CLI
.agents/plugins/marketplace.json  # Codex (nietestowany)
plugins/krawiec-sdlc/
  .claude-plugin/plugin.json      # manifest Claude Code
  plugin.json                     # manifest Copilot CLI
  skills/<skill>/SKILL.md (+ references/, templates/)
  agents/, hooks/, .mcp.json
plugins/krawiec-blind-programmer/  # nakładka na krawiec-sdlc: skille blind-*, agenci blind-* (bez hooka i .mcp.json)
templates/org-standards/          # szkielet pluginu ze standardami organizacji
```

## Ustalenia z testów (Claude Code 2.1, Copilot CLI 1.0.98)

- **`plugin.json` dla Copilota bez `$schema` Agent Plugins.** Z `$schema` Copilot oczekuje komponentów w `com.github.copilot/` i `mcp.json`, więc ładuje tylko skille. W formacie legacy ścieżki są wskazane wprost (`agents`, `mcpServers`).
- **Jeden `hooks/hooks.json` (format Claude Code) działa w obu agentach.**
  - Copilot ustawia `PLUGIN_ROOT` i `CLAUDE_PLUGIN_ROOT`, uruchamia hook w katalogu pluginu i czyta `additionalContext` z najwyższego poziomu JSON.
  - Claude czyta `hookSpecificOutput.additionalContext`.
  - `session-start.sh` zwraca oba pola. Hook wymaga `bash`.
- **Serwery MCP.** Claude Code pomija serwer pluginu, który ma taką samą konfigurację jak serwer już skonfigurowany, nawet pod inną nazwą — narzędzia mają wtedy prefiks tamtego serwera. Copilot przy tej samej nazwie używa serwera z pluginu. Dlatego podagenci nie mają listy dozwolonych narzędzi MCP; reviewer ma `disallowedTools: Edit, Write, NotebookEdit`.
- **Ścieżki.** Pliki wspólne dla kilku skilli leżą w `sdlc-standards` (`references/`, `templates/`). Odwołania do nich są względne wobec pliku, który je zawiera.

## Standardy organizacji

Umowa z pluginem organizacji: skill o nazwie `org-standards`, `SKILL.md` jako indeks (plik, zawartość, kiedy). `krawiec-sdlc` nie zna nazw plików ani ścieżek. Zasada jest w `sdlc-standards` („Standardy organizacji”), odwołania w `sdlc-plan`, `sdlc-implement`, `sdlc-review`. Nie sprawdzone: czy skill z drugiego pluginu jest widoczny w Copilot CLI. Granice „tester scenariuszy nie widzi implementacji” i „`blind-test` nie ocenia implementacji” nie są wymuszone narzędziami (narzędzia nie ograniczają ścieżek): opierają się na instrukcji, świeżym kontekście podagenta i sekcji „Pochodzenie” w `evidence.md`; `blind-test` oznacza brak świeżego kontekstu jako „niezależność nieustalona”.

## Wersjonowanie

Zmiana w pluginie (każdym osobno): podbij jego wersję w obu `plugin.json` i w trzech `marketplace.json`, dopisz wpis do `CHANGELOG.md`. Bez podbicia wersji użytkownicy nie dostaną zmiany. Walidacja: `claude plugin validate <repo>`.

## krawiec-blind-programmer

Zależy od `krawiec-sdlc` (odwołania `krawiec-sdlc:sdlc-*` po nazwie, nie po ścieżce; nie kopiuj jego skilli). Nie ma własnego `.mcp.json` ani hooka: Jira/Confluence i zasady pracy dostarcza `krawiec-sdlc`. Scenariusze to `tc-N` z `docs/scenarios/`. Nie sprawdzone: czy skill z drugiego pluginu jest widoczny w Copilot CLI.
