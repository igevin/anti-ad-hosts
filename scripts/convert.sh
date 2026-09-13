#!/usr/bin/env bash
# Convert the anti-AD domain list into hosts format.
#
# Input : $1 - path to anti-AD domains.txt (one domain per line, `#` comments)
# Output: $2 - path to the generated hosts file
#
# Upstream: https://github.com/privacy-protection-tools/anti-AD (MIT)
set -euo pipefail

SRC="${1:?usage: convert.sh <domains.txt> <output.hosts>}"
DST="${2:?usage: convert.sh <domains.txt> <output.hosts>}"

# Carry the upstream build version through so consumers can tell syncs apart.
VER="$(awk -F= '/^#VER=/{print $2; exit}' "$SRC")"
TOTAL="$(grep -vc '^#' "$SRC" || true)"
NOW="$(date -u +%FT%TZ)"

{
  echo "# Title: anti-AD list in hosts format"
  echo "# Homepage: https://github.com/privacy-protection-tools/anti-AD"
  echo "# License: MIT (see LICENSE)"
  echo "# Converted by: https://github.com/igevin/anti-ad-hosts"
  echo "# Upstream version: ${VER:-unknown}"
  echo "# Total domains: ${TOTAL}"
  echo "# Generated at: ${NOW}"
  echo "#"
  awk '!/^#/ && NF {print "0.0.0.0 " $1}' "$SRC"
} > "$DST"

echo "wrote $DST ($(wc -l < "$DST") lines, ${TOTAL} domains)"
