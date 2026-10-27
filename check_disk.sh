#!/bin/bash
SEUIL="${1:-80}"
UTILISATION=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE: L'espace disque utilisé (${UTILISATION}%) a dépassé le seuil (${SEUIL}%)."
    exit 1
else
    echo "OK: L'espace disque utilisé (${UTILISATION}%) est sous le seuil (${SEUIL}%)."
    exit 0
fi
