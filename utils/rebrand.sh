#!/usr/bin/env bash
# Rebrand Monero documentation to NetCodex
# Replaces textual occurrences of 'Monero' with 'NetCodex' in documentation files.
# Skips LICENSE, src/ and external/ directories.

set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

# Gather documentation files tracked by git
FILES=$(git ls-files "*.md" "*.rst" "*.txt")

for f in $FILES; do
    case "$f" in
        LICENSE|external/*|src/*)
            continue
            ;;
    esac
    if [ -f "$f" ]; then
        sed -i 's/Monero/NetCodex/g' "$f"
    fi
done

echo "Rebranding complete."
