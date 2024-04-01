#! /bin/bash
# Programa para ejemplificar como capturar la información del usuario y validarla utilizando expresiones regulares
# Autor: Ro

identificacionRegex='^[0-9]{10}$'
paisRegex='^EC|COL|US|CL$'
fechaNacimientoRegex='^19|20[0-8]{2}[1-12][1-31]$'

echo "Expresiones regulares"
read -p "Ingrese una identificación:" identificacion
read -p "Ingrese las iniciales del país [EC|COL|US|CL]:" pais
read -p "Ingrese la fecha de nacimiento [yyyyMMdd]:" fechaNacimiento

#Validación identificación
if [[ $identificacion =~ $identificacionRegex ]]; then
	echo "Identificación $identificacion válida"
else
	echo "Identificación $identificacion inválida"
fi

#Validación País
if [[ $pais =~ $paisRegex ]]; then
	echo "País $pais válido"
else
	echo "País $pais inválido"
fi

#Validación Fecha Nacimiento
if [[ $fechaNacimiento =~ $fechaNacimientoRegex ]]; then
	echo "Fecha Nacimiento $fechaNacimiento válida"
else 
	echo "Fecha Nacimiento $fechaNacimiento inválida"
fi
