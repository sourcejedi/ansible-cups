#!/bin/sh
set -o errexit

LPSTAT="$(LC_ALL=C lpstat -p)"
PRINTERS="$(echo "$LPSTAT" | awk '/^printer/ { print $2 }')"

for PRINTER in $PRINTERS; do
    lpadmin -p $PRINTER -o printer-error-policy="$1"
done
