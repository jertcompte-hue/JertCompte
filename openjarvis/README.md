# OpenJarvis — installation et mise en place

[OpenJarvis](https://github.com/open-jarvis/OpenJarvis) est un assistant IA personnel qui fait tourner
les modèles **en local** (via Ollama), sans dépendre d'une API cloud.

## Installation en une commande (macOS · Linux · WSL2)

Depuis ce dossier, en utilisateur normal (pas `sudo`) :

```bash
./openjarvis/install.sh                 # preset par défaut : chat-simple
./openjarvis/install.sh code-assistant  # ou un autre preset
```

Le script :
1. lance l'installateur officiel **sans télémétrie** (`--no-analytics`) → installe `uv`, l'environnement Python,
   Ollama et le modèle de départ `qwen3.5:2b` dans `~/.openjarvis` ;
2. applique le preset choisi (`jarvis init --preset … --force`) ;
3. active le profil de sécurité `personal` ;
4. lance `jarvis doctor` pour vérifier l'installation.

**Windows natif** (PowerShell) : `irm https://open-jarvis.github.io/OpenJarvis/install.ps1 | iex`,
ou l'installeur graphique (`.exe`) depuis la [page des releases](https://github.com/open-jarvis/OpenJarvis/releases/latest).

## Utilisation

| Commande | Effet |
|---|---|
| `jarvis` | discuter dans le terminal |
| `jarvis gui` | interface graphique dans le navigateur (Node.js 22+) |
| `jarvis ask "…"` | question unique |
| `jarvis doctor` | diagnostic |
| `jarvis init --preset <nom> --force` | changer de preset |

Presets : `chat-simple`, `code-assistant`, `deep-research`, `scheduled-monitor`,
`morning-digest-mac`, `morning-digest-linux`, `morning-digest-minimal`.

Si `jarvis` est introuvable après l'installation, ouvre un nouveau terminal
(ou `source ~/.openjarvis/.venv/bin/activate`).

## Configuration

Fichier : `~/.openjarvis/config.toml` — `jarvis config show` pour l'afficher,
`jarvis config set <clé> <valeur>` pour le modifier.
