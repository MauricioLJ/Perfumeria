#!/bin/bash

# Archivo de log
LOG_FILE="Logs/logs.txt"  # Ruta del archivo de log fuera del proyecto

# Archivo de proveedores
ARCHIVO_PROVEEDORES="Proveedores/proveedores.txt"

# Función para agregar proveedores
agregar_proveedor() {
    local nombre=$1
    local contacto=$2
    local fecha=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "Nombre: $nombre, Contacto: $contacto" >> "$ARCHIVO_PROVEEDORES"
    echo "$fecha [INFO] El proveedor $nombre fue agregado en $ARCHIVO_PROVEEDORES" >> "$LOG_FILE"
    echo "El proveedor $nombre fue agregado en $ARCHIVO_PROVEEDORES"
}

# Inputs para proveedores
echo "Nombre del proveedor: "
read nombre_proveedor

echo "Contacto del proveedor: "
read contacto_proveedor

# Llamada a la función para agregar el proveedor
agregar_proveedor "$nombre_proveedor" "$contacto_proveedor"
