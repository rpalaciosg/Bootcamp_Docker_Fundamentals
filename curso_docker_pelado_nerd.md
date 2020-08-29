# Curso de Docker

## Que es docker
Docker comparte el kernel del sistema operativo host. Sobre los contenedores puedo tener configuraciones homogéneas.
Alpine es una distribución muy famosa por el tamaño de 5 o 7 megas. Varios contenedores viven en una misma computadora no importa que sistema base usa cada contenedor.

Docker me permite tener esos ambientes heterogéneos.
Una de las ventajas de docker es que corren un solo proceso. Se debe tener consideraciones a tener en cuenta para que sea seguro, puedo aplicar políticas de seguridad de SELinux. Puedo decirle que use cierta cantidad de memoria RAM.
Docker tienen un load balancer.

Docker se usa para apps stateless. Y si puede tener persistencia local.
Permite separar o encapsular las dependencias de mi aplicación.
Con docker puedo tener un ejecutable, y yo puedo instanciarlo y correrlo 9 veces.
Con algo como un orquestador, ya sea kubernetes, swarn o docker compose.
No se recomienda tener todas las cosas en un mismo contendedor, mejor seria tener nginx y mi código frontenden un contenedor y otro contenedor con el backend en Node.js ya que se puede hacer comunicación entre contendedores.

## Primeros pasos en docker

- Probablemente el comando mas usado: 
  - `docker ps`: lo que hace es mostrar contenedores que están corriendo en este momento.
  
  - `docker pull alphine`: Este comando sirve para descargar contenedores del docker registry.
  - 
  - `docker run hello-world`: lo que hace es correr el contenedor 'hello-world', esto baja la imagen en caso de no tener localmente el contenedor. Cuando no se le pasa nada toma o descargas por defecto 'latest' la ultima imagen. También podemos especificarle la etiqueta de la version de la imagen que queremos `docker run alpine:3.7`
    
  - También podemos pasarle un comando que queremos se ejecute dentro de ese contenedor y me va a mostrar la salida de ese comando.
    `docker run alpine:3.7 ls -l`

  - Si quiero hacer una terminal pueso usar el comando -it (t:terminal, i:interactivo), en este caso en lugar de correr un comando voy a correr un sh que es la shell. y voy a estar dentro de mi shell de linux.
    `docker run -it alpine:3.7 sh`
    Si no le pongo el -it al ejecutar este comando, se va a salir inmediatamente, es importante si quiero correr un comando y quedar dentro, debo poner el -it
  
  - Si hago un 'docker ps' y quiero meterme dentro de uno de los contenedores que esta corriendo, entonces uso este comando `docker exec -it f57e3e9ee9d9 sh`.
    - Esto me sirve exec para ejecutar, -it de forma interactiva 'f57e3e9ee9d9' el numero es el ide del contenedor tomado del docker ps, y al final el comando que queremos ejecutar.