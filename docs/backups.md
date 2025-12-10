# Backup Procedures for Minecraft Server (Public Documentation)

Dokument opisuje ogólne i bezpieczne procedury tworzenia kopii zapasowych
dla serwera Minecraft. Jest to przykład dokumentacji DevOps, który można
stosować w dowolnym środowisku Linux.

---

## 1. Zakres kopii zapasowych

Backup obejmuje wyłącznie:
- katalog `world/`
- konfiguracje (config/, server.properties)
- listy graczy (whitelist.json, ops.json, banned-players.json)
- pliki startowe (np. start.sh)
- pliki systemd jednostki (opcjonalnie)

Nie są backupowane:
- biblioteki (`libraries/`)
- pliki wykonywalne `.jar` (można pobrać ponownie)
- logi lub cache

---

## 2. Lokalizacja backupów

Rekomendowana struktura:

/backups/
daily/
weekly/
monthly/

Backupy powinny być przechowywane poza katalogiem roboczym serwera.

---

## 3. Automatyzacja backupu

Przykładowy skrypt (publiczny, bez danych prywatnych):

#!/usr/bin/env bash
SOURCE_DIR="/opt/minecraft"
BACKUP_DIR="/backups/daily"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
tar -czf $BACKUP_DIR/mc-backup-$DATE.tar.gz $SOURCE_DIR
echo "Backup completed: mc-backup-$DATE.tar.gz"



Skrypt nie zawiera żadnych danych prywatnych i używa ogólnej lokalizacji.

---

## 4. Harmonogram zadań

Przykładowy harmonogram:

- backup dzienny: pełna kopia świata
- backup tygodniowy: dodatkowe konfiguracje
- backup miesięczny: kopia stanu początkowego

Na poziomie systemu można użyć:
- `cron`
- `systemd timers`

---

## 5. Testowanie odtwarzania

Każdy backup jest bezużyteczny, jeśli nie można go odtworzyć.

Rekomenduje się:

1. Odzyskać backup w środowisku testowym.
2. Uruchomić serwer na odzyskanych danych.
3. Zweryfikować integralność świata.

---

## 6. Informacja

Dokument jest neutralny i bezpieczny.  
Nie odnosi się do żadnego prawdziwego serwera Minecraft.
