#!/usr/bin/env bash
set -euo pipefail
# Build and launch cmux STAGING — your daily driver with editor panel.
# Runs alongside production cmux without conflicts.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$(dirname "$SCRIPT_DIR")"

echo "==> Building cmux STAGING..."
"$SCRIPT_DIR/reloads.sh"
echo "==> cmux STAGING is running"
