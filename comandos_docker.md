# Comandos de Docker

- `docker ps`: lo que hace es mostrar contenedores que están corriendo en este momento.
- `docker pull alpine`: Este comando sirve para descargar contenedores del docker registry.
- `docker run hello-world`: lo que hace es correr el contenedor 'hello-world'
- `docker run alpine:3.7 ls -l`: podemos pasarle un comando para que ejecute dentro de ese contenedor después de iniciarlo y mostrar la salida del comando.
- `docker run -it alpine:3.7 sh`: puedo abrir una terminal interactiva de mi contenedor.
- `docker exec -it f57e3e9ee9d9 sh`: entrar a un contenedor que se este ejecutando o correr un comando dentro de un contenedor en ejecución al hacer docker ps.