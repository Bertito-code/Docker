# REPOSITORIO DE GITHUB EN CONTENEDOR PARA PROBAR CODIGO

El cometido de este contenedor es poder clonar repositorios directamente al constuir el contenedor para poder hacer pruebas de codigo directamente en el contenedor.

En este contenedor uso Ubuntu 20.04 pero se puede usar cualquier version de linux para este cometido, solo habria que cambiar los parametros en el dockerfile.

Hay que crear un par de claves rsa, mediante el comando ssh-keygen o si ya tenemos ponerlas dentro del directorio, para que se copien al contenedor y pueda asi hacer el clonado del repositorio. La clave publica debe de estar agregada en github.

