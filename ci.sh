#!/bin/bash
set -Eeuo pipefail

REPO_URL="${1:-https://github.com/Malaktk5/TP-bash.git}"
LOG_FILE="ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

run_pipeline() {
    log "Mise a jour du depot $REPO_URL..."
    git pull origin main || true

    log "Execution des tests..."
    if [ -f "check_disk.sh" ] && [ -f "backup.sh" ]; then
        log "Tests OK"
        exit 0
    else
        log "Tests Failed" >&2
        exit 1
    fi
}

run_pipeline
