# !/bin/bashi
# Programa para ejemplificar el uso de la sentencia case
# Autor: rmunozfernandez

opcion=""


echo "Ejemplo Sentencia Case"
read -p "Ingrese una opción de la A - Z: " opcion
echo -e "\n"

case $opcion in
	"A") echo -e "\nOperación guardar Archivo";;
	"B") echo -e "Operación Eliminar Archivo";;
	[C-E]) echo "No esta implementada la operación";;
	*) echo "Opcion incorrecta"
esac
