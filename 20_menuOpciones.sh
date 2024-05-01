#!/bin/bash
# Programa que permite manejar las utilizades de Postgres
# Autor: rmunozfernandez

opcion=0

while :
do
	# Limpiar la pantall
	clear
	#Desplegar el menú de opciones
	echo "__________________________________________"
	echo "PGUTIL - Programa de Utilidades de Postgre"
	echo "------------------------------------------"
	echo "              MENÚ PRINCIPAL              "
	echo "__________________________________________"
	echo "1. Instalar Postgres"
	echo "2. Desinstalar Postgres"
	echo "3. Sacar un respaldo"
	echo "4. Restaurar respaldo"
	echo "5. Salir"

	#Leer los datos del usuario - capturar información
	read -n1 -p "Ingrese una opción [1-5]: " opcion

	#Validar la opción ingresada
	case $opcion in 
		1) echo -e "\nInstalar postgres..."
			sleep 3
			;;
		2) echo -e "\nDesinstalar postgres..."
			sleep 3
			;;
		3) echo -e "\nSacar respaldo..."
			sleep 3
			;;
		4) echo -e "\nRestaurar respaldo..."
			sleep 3
			;;
		5) echo -e "\nSalir del programa"
			exit 0
			;;
	esac
done

