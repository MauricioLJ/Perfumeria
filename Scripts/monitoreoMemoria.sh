#!/bin/bash

# Ver el uso de la memoria
echo "Uso de memoria:"
free -h

# Ver estadísticas de la memoria virtual
echo "Estadísticas de memoria virtual:"
vmstat

# Monitorear el uso de swap
echo "Uso de swap:"
swapon -s

UMBRAL=80

USO_MEMORIA=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$USO_MEMORIA > $UMBRAL" | bc -l) )); then
	echo "ALERTA: Uso de memoria ha superado el umbral de $UMBRAL%, Uso actual: $USO_MEMORIA%"
else
	echo "Uso de la memoria dentro de los limites: $USO_MEMORIA"
fi