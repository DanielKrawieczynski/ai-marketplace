# Wymagania produktowe (PRD)

## 1. Nazwa i streszczenie
(Nazwa aplikacji lub modułu; 3–5 zdań: co robi i po co.)

## 2. Problem i cele
(Jaki problem rozwiązuje; mierzalne cele biznesowe i KPI.)

## 3. Poza zakresem
(Co świadomie nie jest częścią rozwiązania i dlaczego.)

## 4. Odpowiedzialność i granice
(Co aplikacja robi, czego nie robi, z kim współpracuje; granica kontekstu — osobna aplikacja, moduł czy część istniejącego systemu.)

## 5. Persony i historyjki
(Rola, potrzeba, kontekst. Historyjki „Jako <rola> chcę <akcja>, żeby <cel>” z kryteriami akceptacji i priorytetem: must / should / nice.)

## 6. Przepływy i przypadki brzegowe
(Główne przepływy krok po kroku z aktorami i systemami; scenariusze wyjątkowe, które system musi obsłużyć.)

## 7. Wymagania niefunkcjonalne
(Tylko istotne dla tej aplikacji: dostępność, czas odpowiedzi (P95 / P99), przepustowość, RTO / RPO, skalowanie, odporność, bezpieczeństwo, dane osobowe i retencja, obserwowalność, strategia wdrożenia, zgodność wsteczna kontraktów.)

## 8. Architektura i integracje
(Typ aplikacji (Web API / usługa w tle / CLI), hosting, główne warstwy; z jakimi systemami i serwisami współpracuje i jak (API / zdarzenia / baza).)

## 9. Kontrakty i dane
(Grupy API i zdarzeń (publikowane / konsumowane) oraz główne obszary danych — kierunkowo, bez list endpointów, pól i DDL.)

## 10. Scenariusze testowe
(Pozytywne, negatywne i brzegowe — jako lista; szczegóły w `docs/scenarios/`.)

## 11. Etapy dostarczania
(Co w pierwszej iteracji, co później.)

## 12. Ryzyka i pytania otwarte
(Ryzyka z prawdopodobieństwem, wpływem i mitygacją; kwestie do rozstrzygnięcia przed lub w trakcie implementacji.)
