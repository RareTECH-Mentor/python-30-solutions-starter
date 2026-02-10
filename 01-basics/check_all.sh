#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

fail=0
total=0

find "$root_dir" -mindepth 2 -maxdepth 2 -type f -name check.sh -print0 \
| sort -z \
| while IFS= read -r -d '' f; do
    dir="$(dirname "$f")"
    name="$(basename "$dir")"
    total=$((total+1))

    echo "==> [$name]"
    (
      cd "$dir"
      bash ./check.sh
    ) && echo "✅ PASS: $name" || { echo "❌ FAIL: $name"; fail=$((fail+1)); }

    echo
  done

echo "----"
echo "TOTAL: $total  FAIL: $fail"
exit "$fail"
