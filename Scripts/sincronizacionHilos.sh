#!/bin/bash

LOCK_FILE="/tmp/perfumes_ventas.lock"
LOG_FILE="Logs/logs.txt"

# Intentar adquirir el bloqueo
if flock -n "$LOCK_FILE" -c "sleep 5"; then
    echo "Operación de acceso a los archivos críticos completada correctamente."
    echo "[$(date)] Operación de acceso a archivos críticos realizada con éxito." >> "$LOG_FILE"
else
    echo "No se pudo obtener el bloqueo. Otro proceso está trabajando."
    echo "[$(date)] ERROR: No se pudo acceder a los archivos críticos, ya están en uso." >> "$LOG_FILE"
fi
