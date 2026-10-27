#!/bin/bash
set -Eeuo pipefail

DOSSIER="${1:-data}"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="backup.log"
BACKUP_DIR="backups"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur: Le dossier source '$DOSSIER' n'existe pas." >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"
ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

if tar -czf "$ARCHIVE" "$DOSSIER" 2>> "$LOG_FILE"; then
    echo "[$DATE] Succès: Sauvegarde créée dans $ARCHIVE" | tee -a "$LOG_FILE"
else
    echo "[$DATE] Erreur lors de la création de l'archive" >&2 | tee -a "$LOG_FILE"
    exit 1
fi
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
