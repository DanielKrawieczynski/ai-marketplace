# Manifest dowodów (kontrakt dla CI)

Status: propozycja. Manifest generuje **zaufany etap pipeline'u** z wyników jobów; nie przyjmuje deklaracji z opisu PR-a. Job wykonujący kod PR-a dostarcza raporty jako artefakty, ale nie dostaje tokena do komentowania ani operacji uprzywilejowanych — komentarz publikuje zaufany job, który nie wykonuje kodu PR-a.

```json
{
  "schema": "1",
  "pr": 0, "commit": "<full-sha>", "image": "<name@sha256:...>", "environment": "preproduction",
  "source": { "ticket": "<TICKET>", "scenariosRevision": "<rev>" },
  "scenarios": [
    { "id": "tc-1", "level": ["hermetic"], "testIds": ["..."], "expected": "<obserwowalny wynik>",
      "result": "PASSED", "evidenceIds": ["EV-INT-001"],
      "review": { "status": "APPROVED", "reviewer": "<tożsamość>", "reference": "<zapis review>" } }
  ],
  "criteria": [ { "id": "TSP-01", "status": "PASSED", "evidenceIds": ["EV-UT-001"] } ],
  "evidence": [
    { "id": "EV-COV-001", "kind": "coverage", "status": "PASSED", "source": "<job>", "scope": "<zakres>",
      "covered": 0, "total": 0, "unit": "lines", "threshold": "<odnośnik do konfiguracji>",
      "report": "<URL/niezmienny identyfikator>", "commit": "<full-sha>" }
  ],
  "verdict": { "status": "INSUFFICIENT", "missingEvidenceIds": [], "unresolvedDecisions": [], "exclusions": [] }
}
```

Walidacja przed publikacją: wersja schematu, unikalność ID i referencji; każdy wymagany scenariusz ma wynik i test albo zatwierdzone wyłączenie; kryteria odwołują się do dowodów z tej samej próby i commita; **werdykt wyliczany ze statusów**, pole z niezaufanego joba ignorowane. Liczby w przykładach są ilustracyjne.
