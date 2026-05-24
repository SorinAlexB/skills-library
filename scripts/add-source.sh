#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <github-url> <local-name>"
  echo "Example: $0 https://github.com/org/my-skills.git my-skills"
  exit 1
fi

URL="$1"
NAME="$2"
TARGET="sources/$NAME"

if [[ -d "$TARGET" ]]; then
  echo "Error: $TARGET already exists."
  exit 1
fi

git submodule add "$URL" "$TARGET"

echo ""
echo "Source added at $TARGET"
echo ""
echo "Next steps:"
echo "  1. Add rows for the new skills in the README.md Skills Catalog table"
echo "  2. git add .gitmodules $TARGET README.md"
echo "  3. git commit -m \"add $NAME skill source\""
