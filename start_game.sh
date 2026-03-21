#!/bin/bash
# Serve the game prototype locally
cd "$(dirname "$0")"
PORT="${1:-8000}"
echo "game → http://127.0.0.1:$PORT/prototype/"
python3 -m http.server "$PORT" --bind 127.0.0.1
