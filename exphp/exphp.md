# ejemplo de una app docker con php

Primero crear un directorio `ex_php` que va a ser el que va a tener nuestro codigo fuente:
`mkdir ex_php`

Y dentro de este codigo fuente vamos a crear nuestro archivo PHP.
`vim index.php`

```php
<?php
echo "Hola Docker!";
?>
```

## Creacion del dockerfile

Ahora creamos un archivo que se llama `Dockerfile` la "D" debe estar en mayuscula y fuera de la carpeta del codigo fuente.

1. La primera linea que se crea siempre va a ser un `FROM`, este from va a ser una imagen que ya tiene algo instalado, en lugar de empezar nosotros de empezar un dockerfile con ubuntu e instalarle php, apache y todas las dependencias que necesitamos, lo ideal es ir a buscar a docker HUB para ver si alguien ya hizo una imagen conlas cosas que nosotros vamos a necesitar, no tiene sentido que nosotros instalemos php, apache y todo eso ya que seguramente alguien mas lo hizo y lo hizo bien y siguio todas las buenas practicas. Por eso es bueno iniciar nuestro docker file con una imagen ya creada.

Nos vamos a [DockerHub](https://docker.com) y vamos a buscar php, es buena practica usar las imagenes oficiales. Podemos ver que tenemos una lista de *tags* que son etiquetas que le ponen ellos a las imagenes. Siempre es una buena practica empezar con la ultima iamgen creada. 

Asi que empezamos: FROM [nombre_imagen]:[tag_a_usar], podemos simplemente poner FROM php y no especificar el tag, esolo que hace es bajar la ultima version pero ese tag puede cambiar hoy, maniana y puede llegar a ser incompatible con mi codigo en algun momento. Entonces siempre es una buena practica elegir la version que nosotros queremos y especificarla en nuestro dockerfile. De esa forma si paso el dockerfile nos aseguramos que la imagen que descargue yo es la misma que descargaran las personas a quienes lo pasemos. 

```dockerfile
FROM php:7.4.1-apache-buster
```

2. Vamos a copiar el directorio ex_php a un directorio destino, COPY [dir_origin/] [/dir_Destino]

```dockerfile
FROM php:7.4.1-apache-buster

COPY ex_php/ /var/www/html
```

3. Lo que haremos luego es exponer el puerto 80 que esta dentro del contenedor sea accesible desde el host. EXPOSE 80

```dockerfile
FROM php:7.4.1-apache-buster

COPY ex_php/ /var/www/html

EXPOSE 80
```

4. Ahora lo que vamos hacer es construir la imagen con `docker build`

`docker build -t hola-php .` FiraCode Nerd Font Regular

**-t:** es para ponerle un nombre, no es obligatorio ponerle un nombre pero es mas facil porque va a generar como un hash que es bastante largo para correr. En este caso le ponemos 'hola-php'

**.:** Punto es el directorio donde esta el dockerfile, en este caso es punto (.) porque estaoy en el mismo directorio.

Lo que hace primero es descargar esa imagen y le va agregar las capaz nuestras. Que son va agregar la capa de nuestro codigo que hacemos con la linea `COPY` y la linea de exponer el puerto 80 `EXPOSE 80`

5. Ahora para correr nuestra imagen, tenemos que hacer  es un `docker run`

`docker run -p 80:80 hola-php`
**-p 80:80 =>** Este parametro lo que va hacer es exponer el puerto 80 del host y apuntar al puerto 80 del contenedor, de esa forma podemos acceder de forma externa a nuestro contenedor.

De esta forma ya tenemos iniciado nuestro contenedor y nuestra imagen de php con apache ya esta corriendo. Como vemos ya tenemos la salida del log de Apache.

## Volumenes
En el caso de que hagamos cambios a nuestra aplicacion, debemos volver a construir nuestro contenedor y agregar el codigo modificado para que se cree una nueva imagen y la podamos correr.

En el caso de estar desarrollando localmente, esto se hace engorroso y no queremos estar construyendo nuestro contenedor cada vez que hacemos un pequenio cambio. 

Docker creo algo que se llama volumenes, que nos permiten entre otras cosas agarrar un directorio de nuestro host y ponerlo dentro del contenedor y esto se sincroniza automaticamente. Esto quiere decir que cuando modificamos nuestro archivo en el host se va a ver modificado directamente en el contenedor.

Vamos a volver a correr nuestro contenedor pero agregar una nueva opcion:

`docker run -p 80:80 -v ~/Cursos/Bootcamp_Docker_Fundamentals/exphp/:/var/www/html hola-php`

**-v [directorio-origen_a_montar]:[directorio_destino_donde_montar]** Esto va a montar el directorio de nuestro host en el directorio que asignamos

Iniciamos nuevamente el contenedor y si refrescamos el navegador vemos que se actualizan los cambios. De ahora en adelante los cambios que se hagan se van a sincronizar automaticamente del host al contenedor.


Cada contenedor corre su proceso, en este caso el proceso es apache. En el caso que apache se caiga o tenga algun problema el contenedor se va a caer y vamos a tener que volverlo a levantar.

Hay formas para que se inicien automaticamente, pero es importante tener en cuenta que nuestro proceso tiene que estar corriendo para que el contenedor funcione.