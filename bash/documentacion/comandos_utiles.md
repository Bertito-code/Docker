# COMANDOS UTILES

- sudo visudo -c : Check de sintaxis del sudoers
- sudo visudo -f : Editar un arhivo sudoers concreto
- dig : Buscar dominios
- sudo crontab -l -uroot : Ver crontab del usuario root
- ps faux : Ver procesos en ejecucion y consumo
- dpkg --get-selections : Saber paquetes instalados
- curl ifconfig.me : Saber ip publica del equipo
- nl : Como cat pero numerando las lineas
- ls -lat : Lista y pone los mas nuevos al principio
- grep -r : Buscar recursivamente
- dpkg -s : Saber version del servicio
- du -sh : Saber espacio ocupado
- vim diff : Comparar archivos en vim
- dpkg -x : Ver contenido de paquete .deb instalado
- update db && locate : Buscar
- ssh -i /home${USER}/.ssh/.key -p 22 ip_nombre_host : Usar una rsa concreta, con un puerto especifico para conectarse a un equipo
- watch : Lanzar comando cada 2 segundos, se puede configurar
- grep -v : Busca y muestra todo menos lo indicado
- traceroute : Ver el camino que sigue una conexion
- netstat -a -l :
- find / -name *.txt : Busca los archivos en raiz que terminan en .txt
- who : Saber usuarios conectados al equipo
- route : Saber salida a internet
- printenv : Ver todas la variables de entorno
- ln -sfn
- find /var/log/ -type f -ctime +90 -delete&>/dev/null : Busca dentro del directorio indicado todos los archivos que tengan mas de 90 dias y los elimina
- sudo update-alternatives --config editor : Elegir con que editor abrir el sudoers


