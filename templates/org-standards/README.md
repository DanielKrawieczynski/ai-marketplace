# org-standards

Prywatny plugin ze standardami organizacji, używany przez plugin `krawiec-sdlc`. Plugin wykrywa skill `org-standards`, czyta jego indeks (`skills/org-standards/SKILL.md`) i sięga po pliki z `references/` pasujące do zadania.

## Instalacja

```shell
claude plugin marketplace add <właściciel>/org-standards
claude plugin install org-standards@org-standards
```

(Copilot CLI: `copilot plugin …` z tymi samymi argumentami.) Wymagany dostęp do prywatnego repo (`gh auth login`).

## Dodawanie treści

1. Dodaj plik do `skills/org-standards/references/`.
2. Dopisz wiersz do tabeli w `skills/org-standards/SKILL.md`: plik, zawartość, kiedy czytać.
3. Podbij `version` w `plugin.json`, `.claude-plugin/plugin.json` i obu `marketplace.json`.

Pisz same reguły dla kodu i procesu: zwięźle, bez nazwisk, bez sekretów i danych z produkcji.

## Szkielet

To jest szkielet pluginu z repozytorium `krawiec-sdlc`: struktura, indeks i puste sekcje do uzupełnienia. Skopiuj go do własnego (najlepiej prywatnego) repozytorium i wypełnij. Wymagana jest tylko nazwa skilla `org-standards`; liczba i nazwy plików w `references/` są dowolne, byle indeks w `SKILL.md` je opisywał.
