# ! /bin/bash
# Programa para ejemplificar el la forma de como transferir por la red utilizando el comando rsync, utilizando las opciones de empaquetamiento para optimizar la velocidad de transferencia

echo "Empaquetar todos los scripts de la carpeta shellCourse y transferirlos por la red a otro equipo utilizando el comando rsync"

host=""
usuario=""
read -p "Ingrese el host:" host
read -p "Ingrese el usuario:" usuario
echo -e "\nEn este momento se procederá a empaquetar la carpeta y transferirla según los datos ingresados"
rsync -avz $(pwd) $usuario@$host:/home/usuario
