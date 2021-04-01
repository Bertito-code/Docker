#!/bin/bash

# Autor: Alberto Gonzalez


# Variables
numero_peticiones=
url_objetivo=
fichero_datos=
# Poner tantos objetivos como sean necesarios o=n
objetivo0=
objetivo1=
objetivo2=
objetivo3=
objetivon=
resultado=

# Funciones
bucle() {
while [ ${i} -gt -1 ]
    do
        host ${url_objetivo} >> ${fichero_datos}
        ((i--))
done
}

tratamiento_datos() {
        grep ${objetivo0} ${fichero_datos} | wc -l >> ${resultado}

}


limpieza() {
        rm ${fichero_datos}
}

main() {
        bucle
        tratamiento_datos
        limpieza
}
# Programa
main