# Minecraft Server Runbook (Public Documentation)

Niniejszy runbook opisuje standardowe działania operacyjne związane
z zarządzaniem serwerem Minecraft w środowisku Linux. Dokument jest
neutralny i nie odnosi się do żadnych danych prywatnych.

---

## 1. Uruchamianie serwera

Jeśli serwer jest zarządzany przez systemd (przykład):

sudo systemctl start minecraft

Wersja manualna (skrypt start.sh):

./start.sh

---

## 2. Zatrzymywanie serwera

sudo systemctl stop minecraft

lub manualnie:

1. Połącz się do konsoli serwera.
2. Wpisz polecenie:

stop

---

## 3. Restart serwera

sudo systemctl restart minecraft

---

## 4. Status serwera

sudo systemctl status minecraft

lub przy pomocy skryptu status.sh:

./scripts/status.sh

---

## 5. Backup danych

Backup powinien obejmować:
- katalog `world/`
- konfiguracje (`config/`, `server.properties`)
- listy graczy (`whitelist.json`, `ops.json`, itd.)

Przykład:

tar -czf backup-$(date +%F-%H-%M).tar.gz world/

---

## 6. Logi serwera

Logi systemd:

journalctl -u minecraft -f

Logi Minecraft:

logs/latest.log

---

## 7. Informacja

Runbook ma charakter poglądowy i nie zawiera żadnych prawdziwych danych.
Można go stosować w dowolnej infrastrukturze jako przykład operacyjny.
