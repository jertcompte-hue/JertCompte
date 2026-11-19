#!/usr/bin/env bash
# Installe et configure OpenJarvis (https://github.com/open-jarvis/OpenJarvis)
# sur macOS, Linux ou WSL2. À lancer en utilisateur normal (pas en root/sudo).
set -euo pipefail

PRESET="${1:-chat-simple}"   # chat-simple | code-assistant | deep-research | scheduled-monitor | morning-digest-mac | morning-digest-linux

if [[ "$(id -u)" -eq 0 ]]; then
  echo "Ne lance pas ce script en root : OpenJarvis s'installe dans ~/.openjarvis." >&2
  exit 1
fi

echo "==> Installation d'OpenJarvis (uv, venv Python, Ollama, modèle qwen3.5:2b)…"
curl -fsSL https://open-jarvis.github.io/OpenJarvis/install.sh | bash -s -- --no-analytics

# Rendre la commande `jarvis` disponible dans ce shell
export PATH="$HOME/.local/bin:$HOME/.openjarvis/.venv/bin:$PATH"

echo "==> Configuration avec le preset « $PRESET »…"
jarvis init --preset "$PRESET" --force --no-analytics
jarvis config set security.profile personal 2>/dev/null || true

echo "==> Diagnostic :"
jarvis doctor || true

cat <<MSG

OpenJarvis est prêt.
  jarvis          → discuter dans le terminal
  jarvis gui      → interface graphique dans le navigateur (Node.js 22+ requis)
  jarvis doctor   → vérifier l'état de l'installation
MSG
