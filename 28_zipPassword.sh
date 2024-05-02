# ! /bin/bash
# Programa para ejemplificar el empaquetamiento con clave utilizando zip

echo "Empaquetar todos los scripts de la carpeta shellCourse con zip y asignale una clave de seguridad"
zip -e shellCourse.zip *.sh
