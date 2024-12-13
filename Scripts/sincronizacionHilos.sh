#!/bin/bash

LOCK_FILE="/tmp/locks.txt"

# Intentar adquirir el bloqueo
if flock -n "$LOCK_FILE" -c "sleep 5"; then
    echo "Operación crítica completada correctamente."
    echo "$(date): Operación crítica realizada" >> "Logs/logs.txt"
else
    echo "No se pudo obtener el bloqueo. Otro proceso está trabajando."
    echo "$(date): ERROR - Operación crítica no pudo completarse" >> "Logs/logs.txt"
fi

