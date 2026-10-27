#!/bin/bash
set -Eeuo pipefail

DOSSIER="${1:-data}"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="backup_$DATE.tar.gz"
LOG_FILE="backup.log"

if [ ! -d "$DOSSIER" ]; then
    echo "Dossier introuvable" >&2
    exit 1
fi

if tar -czf "$ARCHIVE" "$DOSSIER" 2>> "$LOG_FILE"; then
    echo "[$DATE] Sauvegarde OK" | tee -a "$LOG_FILE"
else
    echo "[$DATE] Echec de la sauvegarde !" >&2 | tee -a "$LOG_FILE"
    exit 1
fi

find . -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;
