# Bash Shell Course

### Debug en Script
bash -v Utilizado para ver el resultado detallado de nuestro script, evaluando línea por línea.
bash -x Utilizado para ver desplegar la información de los comandos que son utilizados, capturando el comando y su salida.

Ejemplo:
```bash
bash -v 2_variables_2.sh
bash -x 2_variables_2.sh
```

### Validación de datos

```bash
read -n10 -p -s "Ingrese clave:"
```

-n Limita la entrada de caracteres a la cantidad indicada.
-p Devuelve el prompt en la misma línea.
-s No muestra lo escrito en pantalla.