#!/bin/bash

# Archivo de log
LOG_FILE="Logs/logs.txt"  # Ruta del archivo de log fuera del proyecto

# Archivo de puntos de venta
ARCHIVO_PUNTO_VENTA="PuntosVenta/puntosVenta.txt"

# Función para agregar puntos de venta
agregar_punto_venta() {
    local nombre=$1
    local direccion=$2
    local contacto=$3
    local fecha=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "Nombre: $nombre, Direccion: $direccion, Contacto: $contacto" >> "$ARCHIVO_PUNTO_VENTA"
    echo "$fecha [INFO] El punto de venta $nombre fue agregado en $ARCHIVO_PUNTO_VENTA" >> "$LOG_FILE"
    echo "El punto de venta $nombre fue agregado en $ARCHIVO_PUNTO_VENTA"
}

# Inputs para puntos de venta
echo "Nombre del punto de venta: "
read nombre_punto_venta

echo "Direccion del punto de venta: "
read direccion_punto_venta

echo "Numero de contacto del punto de venta: "
read contacto_punto_venta

# Llamada a la función para agregar el punto de venta
agregar_punto_venta "$nombre_punto_venta" "$direccion_punto_venta" "$contacto_punto_venta"
