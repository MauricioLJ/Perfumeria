#!/bin/bash

LOG_FILE="Logs/logs.txt"
PERFUMES_FILE="Perfumes/perfumes.txt"

reabastecer_perfumes() {
    local fecha=$(date '+%Y-%m-%d %H:%M:%S')

    if [ ! -f "$PERFUMES_FILE" ] || [ ! -s "$PERFUMES_FILE" ]; then
        echo "No hay perfumes en el inventario, agregando perfumes de reposición."
        echo "[$fecha] No hay perfumes, se inicia el reabastecimiento." >> "$LOG_FILE"

        # Simulación de reabastecimiento (se podrían agregar perfumes específicos)
        echo "PerfumePrueba,20.00" >> "$PERFUMES_FILE"
        echo "PerfumeAroma,25.50" >> "$PERFUMES_FILE"

        echo "[$fecha] Se reabasteció el inventario de perfumes." >> "$LOG_FILE"
    else
        echo "El inventario está completo, no se necesita reabastecimiento."
    fi
}

# Lanza un proceso en segundo plano
while true; do
    reabastecer_perfumes
    sleep 1800  # Se ejecuta cada 30 minutos
done &
PID=$!
echo "[$(date)] Proceso de reabastecimiento iniciado en segundo plano con PID $PID." >> "$LOG_FILE"
