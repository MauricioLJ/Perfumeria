#!/bin/bash

#!/bin/bash

# Directorios
PERFUMES_FILE="Perfumes/perfumes.txt"
LOG_FILE="Logs/logs.txt"  # Ruta del archivo de log fuera del proyecto

# Función para agregar perfumes
agregar_perfume() {
    local perfume_name=$1
    local perfume_price=$2

    # Registrar en el log
    local fecha=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ ! -f "$PERFUMES_FILE" ]; then
        echo "$perfume_name,$perfume_price" > "$PERFUMES_FILE"
        echo "$fecha [INFO] Se agregó $perfume_name (precio: $perfume_price) a $PERFUMES_FILE" >> "$LOG_FILE"
        echo "Se agregó $perfume_name (precio: $perfume_price) a $PERFUMES_FILE"
    else
        echo "$perfume_name,$perfume_price" >> "$PERFUMES_FILE"
        echo "$fecha [INFO] Se agregó $perfume_name (precio: $perfume_price) a $PERFUMES_FILE" >> "$LOG_FILE"
        echo "Se agregó $perfume_name (precio: $perfume_price) a $PERFUMES_FILE"
    fi
}

# Inputs
echo "Ingrese el nombre del nuevo perfume: "
read perfume_name

echo "Ingrese el precio del nuevo perfume: $"
read perfume_price

# Llamada a la función para agregar el perfume
agregar_perfume "$perfume_name" "$perfume_price"
