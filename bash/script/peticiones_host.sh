#!/bin/bash

# Autor: Alberto Gonzalez


# Variables
i=10000
url_objetivo=
fichero_datos=datos_brutos.log
objetivo0=
objetivo1=
fichero_resultado=resultado_prueba.log

# Funciones
yeah() {
while [ ${i} -gt -1 ]
    do
        host ${url_objetivo} >> ${fichero_datos}
        ((i--))
done
}

tratamiento_datos() {
        grep ${objetivo0} ${fichero_datos} | wc -l >> ${fichero_resultado}


}


limpieza() {
        rm ${fichero_datos}

}

# Programa
yeah
tratamiento_datos
limpieza