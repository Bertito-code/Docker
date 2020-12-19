# MATAR PROCESOS ZOMBIES

Estos procesos se identifican por Z o defunct. No se pueden eliminar con un kill -9, para eliminarlos hay que matar al proceso padre. Para identificar el proceso padre podemos lanzar varios comandos:

- ps -eo pid,ppid | grep pid
- ps -eo pid,ppid,commmand | grep defunct


