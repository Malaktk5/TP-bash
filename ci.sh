#!/bin/bash
set -Eeuo pipefail

REPO_URL="${1:-https://github.com/Malaktk5/TP-bash.git}"
LOG_FILE="ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

run_pipeline() {
    log "Démarrage du pipeline CI pour $REPO_URL..."
    
    log "Étape 1: Mettre à jour / cloner le dépôt..."
    git pull origin main || true

    log "Étape 2: Exécution des tests..."
    if [ -f "check_disk.sh" ] && [ -f "backup.sh" ]; then
        log "Test réussi: Tous les scripts requis sont présents."
    else
        log "Test échoué: Des scripts sont manquants." >&2
        exit 1
    fi

    log "Pipeline CI terminé avec succès."
    exit 0
}

run_pipeline
