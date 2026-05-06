#!/usr/bin/env bash
# Deploy AI Installer site
# Uso:
#   1) Vercel:      ./deploy.sh vercel
#   2) Surge (legacy backup): ./deploy.sh surge
#   3) GitHub Pages: ./deploy.sh github
set -euo pipefail

PROVIDER="${1:-vercel}"
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

case "$PROVIDER" in
  vercel)
    echo "→ Deploy su Vercel..."
    if ! command -v vercel >/dev/null 2>&1; then
      echo "Installo Vercel CLI..."
      npm install -g vercel
    fi
    vercel --prod --yes
    echo "✓ Deploy completato. Aggiungi il dominio custom da dashboard."
    ;;
  surge)
    echo "→ Deploy backup su Surge..."
    if ! command -v surge >/dev/null 2>&1; then
      npm install -g surge
    fi
    surge . ai-installer-italo.surge.sh
    ;;
  github)
    echo "→ Deploy su GitHub Pages..."
    if [ ! -d .git ]; then
      git init && git add . && git commit -m "init"
    fi
    echo "Crea repo su GitHub e pusha. Poi attiva Pages da settings."
    ;;
  *)
    echo "Provider sconosciuto: $PROVIDER"
    echo "Usa: vercel | surge | github"
    exit 1
    ;;
esac
