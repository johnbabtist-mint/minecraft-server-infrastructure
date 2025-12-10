# Minecraft Server Architecture (Public Documentation)

Niniejszy dokument przedstawia przykładową, uproszczoną architekturę
serwera Minecraft w środowisku Linux. Dokument ma charakter edukacyjny
i służy jako przykład dobrych praktyk DevOps.

---

## 1. Warstwa systemu operacyjnego
- Ubuntu Server (dowolna wersja LTS)
- systemd jako menedżer usług
- UFW jako podstawowy firewall
- użytkownik dedykowany do uruchamiania serwera (np. minecraft)

---

## 2. Warstwa aplikacji Minecraft
- Silnik serwera: Forge / Fabric / Spigot / Paper (dowolny)
- Katalog roboczy zawiera:
  - `server.properties`
  - `mods/` lub `plugins/`
  - `config/`
  - `world/`
- Usługa uruchamiana przez plik systemd (np. `minecraft.service`)

---

## 3. Warstwa automatyzacji (DevOps)
- skrypty Bash: start, stop, restart, backup, status
- monitoring stanu usługi
- rotacja logów
- procedury aktualizacji silnika

---

## 4. Warstwa bezpieczeństwa
- brak logowania root przez SSH
- logowanie kluczami SSH
- zmiana domyślnego portu usług (opcjonalnie)
- firewall ograniczający dostęp
- backup wykonywany cyklicznie

---

## 5. Kopie zapasowe
- katalog `backups/` (poza repozytorium)
- backupy świata lub konfiguracji
- proces automatyczny lub ręczny

---

## 6. Informacja
Dokument nie odnosi się do żadnej prawdziwej infrastruktury finansowanej,
produkcyjnej ani prywatnej. Jest to wyłącznie publiczny przykład techniczny.
