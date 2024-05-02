#!/bin/bash
# Programa que permite manejar las utilizades de Postgres
# Autor: rmunozfernandez

opcion=0
fechaActual=`date +%Y%m%d`

instalar_postgres(){
	echo -e "\nVerificar instalación postgres..."
	verifyInstall=$(which psql)
	if [ $? -eq 0 ]; then
		echo "\Postgres ya se encuentra instalado en el equipo"
	else
		read -s -p "Ingresar contraseña de sudo:" password
		read -s -p "Ingresar contraseña a utilizan en postgres:" passwordPostgres
		echo "$password" | sudo -S apt update
		echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
		sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
		echo "$password" | sudo -S systemctl enable postgresql.service
		echo "$password" | sudo -S systemctl start postgresql.service
	fi
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

desinstalar_postgres() {
	read -s -p "Ingresar contraseña de sudo:" password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
	echo "$password" | sudo -S rm -r /etc/postgresql
	echo "$password" | sudo -S rm -r /etc/postgresql-common
	echo "$password" | sudo -S rm -r /var/lib/postgresql
	echo "$password" | sudo -S userdel -r potgres
	echo "$password" | sudo -S groupdel postgresql
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

sacar_respaldo() {
	echo "Listar las bases de datos"
	sudo -u postgres psql -c "\l"
	read -p "Elegir la base de datos a respaldar:" bddRespaldo
	echo -e "\n"
	if [ -d "$1"  ]; then
		echo "Establecer permisos al directorio"
		echo "$password" | sudo -S chmod 755 $1
		echo "Realizando respaldo"
		sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
		echo "Respaldo realizado correctamente en la ubicación:$1/bddRespaldo$fechaActual.bak"
	else
		echo "El directorio $1 no existe"
	fi
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

restaurar_respaldo() {
	echo "Listar los respaldos"
	read -p "Ingresar el directorio donde están los respaldos:" directorioBackup
	ls -la $directorioBackup
	read -p "Elegir el respaldo a restaurar:" respaldoRestaurar
	echo -e "\n"
	read -p "Ingrese el nombre de la base de datos destino:" bddDestino
	# Verificar si la bdd existe
	verifyBdd=$(sudo -u postgres psql -lqt | cut-d \| -f 1 | grep -wq $bddDestino)
	if [ $? -eq 0 ]; then
		echo "Restaurando en la bdd destino: $bddDestino"
	else
		sudo -u postgres psql -c "create database $bddDestino"
	fi

	if [ -f "$1/$respaldoRestaurar" ]; then
		echo "Restaurando respaldo..."
		sudo -u postgres pg_restore -Fc -d $bddDestino "$directorioBackup/$respaldoRestaurar"
		echo "Listar la base de datos"
		sudo -u postgres psql -c "\l"
	else
		echo "El respaldo $respaldoRestaurar no existe"
	fi
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}


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
	echo -e "\n"

	#Validar la opción ingresada
	case $opcion in 
		1) instalar_postgres
			sleep 3
			;;
		2) desinstalar_postgres
			sleep 3
			;;
		3) read -p "Directorio Backup:" directorioBackup
			sacar_respaldo $directorioBackup
			sleep 3
			;;
		4) read -p "Directorio Respaldo:" directorioRespaldo
			restaurar_respaldo $directorioRespaldo
			sleep 3
			;;
		5) echo -e "\nSalir del programa"
			exit 0
			;;
	esac
done

