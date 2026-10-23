# krawiec-sdlc — plugin dla agentów AI

Plugin dla Claude Code i GitHub Copilot CLI: proces wytwarzania oprogramowania z AI — standardy pracy z kodem, onboarding repozytorium, planowanie, implementacja (także TDD), review, dokumentacja, Pull Request, ADR.

## Instalacja

```shell
# Claude Code
claude plugin marketplace add DanielKrawieczynski/ai-marketplace
claude plugin install krawiec-sdlc@krawiec

# GitHub Copilot CLI
copilot plugin marketplace add DanielKrawieczynski/ai-marketplace
copilot plugin install krawiec-sdlc@krawiec
```

Po instalacji zacznij nową sesję. Aktualizacja w Claude Code: `claude plugin marketplace update krawiec`, potem `claude plugin update krawiec-sdlc@krawiec`.

Do Jiry i Confluence logujesz się przez OAuth przy pierwszym użyciu: w Claude Code `/mcp` → `atlassian`.

## Skille

| Skill | Do czego |
|-------|----------|
| `sdlc-standards` | ticket, gałąź, commity, standardy kodu, NFR, format raportów, szablony `/docs`, `/.vibe`, `/.vibe/plan` |
| `sdlc-init` | onboarding repo: generuje `/docs` (dla ludzi) i `/.vibe` (dla agentów) |
| `sdlc-plan` | plan zmiany w `/.vibe/plan/<TICKET>/` (tryby: zmiana, funkcja, greenfield) |
| `sdlc-implement` | implementacja planu krok po kroku |
| `sdlc-implement-tdd` | implementacja w TDD z rolami (tester, implementer, refaktoryzator) |
| `sdlc-review` | review przed PR (tryby: standard, security, nfr, full) |
| `sdlc-docs` | aktualizacja i weryfikacja dokumentacji względem kodu |
| `sdlc-pr` | wystawienie Pull Requesta |
| `sdlc-deliver` | cały przebieg od planu do PR |
| `sdlc-adr` | zapis decyzji architektonicznej |

Podagenci: `sdlc-reviewer`, `sdlc-tdd-tester`, `sdlc-tdd-implementer`, `sdlc-tdd-refactorer`. Serwer MCP: `atlassian`.

Skille uruchamiają się same, gdy agent rozpozna zadanie. W Claude Code możesz je też wywołać wprost, np. `/krawiec-sdlc:sdlc-deliver PROJ-1234`.

### Workflow

```
sdlc-plan → sdlc-implement (lub sdlc-implement-tdd) → sdlc-review → sdlc-docs → sdlc-pr
```

- **„Dowieź PROJ-1234”** (`sdlc-deliver`): cały przebieg, zatrzymuje się po planie i przed PR. Warianty: „… w trybie auto”, „… w TDD”.
- **Etapami:** „Zaplanuj PROJ-1234”, „Zaimplementuj plan”, „Zrób review przed PR”, „Zaktualizuj docs”, „Wystaw PR”.
- **Onboarding repo:** „Wygeneruj dokumentację” (`sdlc-init`) tworzy `/docs` dla ludzi i `/.vibe` dla agentów. Plany zmian trafiają do `/.vibe/plan/<TICKET>/`.
- **ADR:** „Zapisz ADR: …”.

Hook SessionStart wstrzykuje zasady z `sdlc-standards` do każdej sesji; skille odsyłają do nich zamiast je powtarzać.

Granice automatyzacji: przed pierwszym commitem agent pyta, czy commitować i w jakim formacie. Push, PR oraz zapis do Jiry i Confluence robi dopiero po potwierdzeniu. Merge zawsze należy do człowieka.

## Standardy organizacji

`krawiec-sdlc` działa na ogólnych, domyślnych standardach. Firma może dołożyć własne: wystarczy plugin ze skillem o nazwie `org-standards`, którego `SKILL.md` jest indeksem tematów (plik, zawartość, kiedy czytać). `sdlc` wykrywa go sam i daje jego regułom pierwszeństwo. Gotowy szkielet do skopiowania do własnego (np. prywatnego) repo: [templates/org-standards/](templates/org-standards/README.md).

## Rozwój

Notatki techniczne o manifestach, hookach i MCP: [DEVELOPMENT.md](DEVELOPMENT.md).

## Licencja

[MIT](LICENSE) © 2026 DK4Dev Daniel Krawieczyński
