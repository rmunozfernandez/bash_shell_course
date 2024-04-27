# !/bin/bashi
# Programa para ejemplificar el uso de la sentencia de decisión if, else
# Autor: rmunozfernandez

notaClase=0
edad=0

echo "Ejemplo Sentencia If - else"
read -n1 -p "Indique cuál es su nota (1-9):" notaClase
echo -e "\n"
if (( $notaClase >= 7 )); then
	echo "El alumno aprueba la materia"
else
	echo "El alumno reprueba la materia"
fi

read -p "Indique cuál es su edad:" edad
if [ $edad -le 18 ]; then
	echo "La persona no puede sufragar"
else
	echo "La persona puede sufragar"
fi
