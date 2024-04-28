# ! /bin/bash
# Programa para ejemplificar el uso de los arrays

arrayNumeros=(1 2 3 4 5 6)
arrayCadenas=(Marco, Antonio, Pedro, Susana)
arrayRangos=({A..Z} {10..20})

# Imprimir todos los calores
echo "Arreglo de Números:${arrayNumeros[*]}"
echo "Arreglo de Cadenas:${arrayCadenas[*]}"
echo "Arreglo de Rangos:${arrayRangos[*]}"

# Imprimir los tamaños de los arrays
echo "Tamaño Arreglo de Números:${#arrayNumeros[*]}"
echo "Tamaño Arreglo de Cadenas:${#arrayCadenas[*]}"
echo "Tamaño Arreglo de Rangos:${#arrayRangos[*]}"

# Imprimir la posición 3 del array de números, cadenas y rangos
echo "Posición 3 Arreglo de Números:${arrayNumeros[3]}"
echo "Posición 3 Arreglo de Cadenas:${arrayCadenas[3]}"
echo "Posición 3 Arreglo de Rangos:${arrayRangos[3]}"

# Añadir y eliminar valores en un array
arrayNumeros[7]=20
unset arrayNumeros[0]
echo "Array de Números:${arrayNumeros[*]}"
echo "Tamaño Array Números:${#arrayNumeros[*]}"
