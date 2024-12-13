#!/bin/bash

# Archivo de log
LOG_FILE="Logs/logs.txt"

# Ver el uso de la memoria
echo "Uso de memoria:"
free -h >> "$LOG_FILE"

# Ver estadísticas de la memoria virtual
echo "Estadísticas de memoria virtual:"
vmstat >> "$LOG_FILE"

# Monitorear el uso de swap
echo "Uso de swap:"
swapon -s >> "$LOG_FILE"

UMBRAL=80

USO_MEMORIA=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$USO_MEMORIA > $UMBRAL" | bc -l) )); then
    echo "ALERTA: Uso de memoria ha superado el umbral de $UMBRAL%, Uso actual: $USO_MEMORIA%"
    echo "[$(date)] ALERTA: Uso de memoria ha superado el umbral de $UMBRAL%, Uso actual: $USO_MEMORIA%" >> "$LOG_FILE"
else
    echo "Uso de la memoria dentro de los límites: $USO_MEMORIA%"
    echo "[$(date)] Uso de la memoria dentro de los límites: $USO_MEMORIA%" >> "$LOG_FILE"
fi
