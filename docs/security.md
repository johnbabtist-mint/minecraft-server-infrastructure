# Security Guidelines for Minecraft Server (Public Documentation)

Dokument opisuje ogólne zasady bezpieczeństwa stosowane przy tworzeniu
i utrzymywaniu serwera Minecraft w środowisku Linux. Zawarte poniżej
informacje są neutralne i mogą być stosowane w dowolnej infrastrukturze.

---

## 1. Dostęp do serwera
- logowanie przez SSH wyłącznie z użyciem kluczy
- wyłączone logowanie użytkownika root
- zmiana domyślnego portu (opcjonalna, zależna od polityki firmy)
- firewall (UFW) otwiera tylko niezbędne porty:
  - port Minecraft
  - port SSH
- regularny przegląd logów:  
  `/var/log/auth.log`, `/var/log/syslog`, logi Minecraft

---

## 2. Zarządzanie użytkownikami
- dedykowany użytkownik systemowy, np. `minecraft`
- brak uprawnień sudo dla użytkownika serwera
- katalog roboczy serwera z ograniczonymi uprawnieniami (chmod 750)

---

## 3. Hardening systemu
- automatyczne aktualizacje bezpieczeństwa
- blokada brute force (Fail2Ban lub CrowdSec)
- obsługa tylko niezbędnych usług systemowych
- rotacja logów przez systemd / logrotate

---

## 4. Bezpieczeństwo aplikacyjne
- brak plików konfiguracyjnych w repo publicznym
- brak danych prywatnych w logach i w dokumentacji
- kontrola wersji tylko na czystych plikach templatujących
- zachowanie kompatybilności z politykami firmy lub projektu

---

## 5. Kopie zapasowe
- backup zapisany poza katalogiem serwera
- możliwość cyklicznego backupu przez cron lub systemd timer
- testy odtwarzania backupu raz na cykl

---

## 6. Monitoring
- sprawdzanie procesów (ps, systemctl)
- monitorowanie obciążenia: CPU, RAM, IO
- przy większych środowiskach: Prometheus + Grafana

---

## 7. Informacja
Dokument zawiera wyłącznie bezpieczne i uniwersalne treści.
Nie odnosi się do żadnego faktycznego środowiska produkcyjnego.
