# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de iteración For

arrayNumeros=(1 2 3 4 5 6)

echo "Iterar en la Lista de Números"
for num in ${arrayNumeros[*]}
do
	echo "número:$num"
done

echo "Iterar en la Lista de Cadenas"
for nom in "Marco" "Pedro" "Luis" "Daniela"
do
	echo "nombre:$nom"
done

echo "Iterar en Archivos"
for file in *
do
	echo "Nombre archivo:$file"
done

echo "Iterar utilizando un comando"
for fil in $(ls)
do
	echo "Nombre archo:$fil"
done

echo "Iterar utilizando el formato tradicional"
for ((i=1; i<10; i++))
do
	echo "Número:$i"
done

