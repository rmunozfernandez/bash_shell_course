# ! /bin/bash
# Programa para ejemplificar como se lee en un archivo

echo "Leer en un archivo"

cat $1
echo -e "\nAlmacenar los valores en una variable"
valorCat=`cat $1`
echo "$valorCat"

# Se utiliza la variable IFS (Internat Field Separator) para evitar que los espacios en blanco al inicio o al final se recorten
echo -e "\nLeer archivos línea por línea utilizando while"
while IFS= read linea
do
	echo "$linea"
done < $1
