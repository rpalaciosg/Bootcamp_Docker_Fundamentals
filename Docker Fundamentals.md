# Docker Bootcamp Fundamentals

Marcos Cano - Lider de la comunidad de Docker guatemala.
Docker Guatemal o meetup.com/dockerguatemala o kubernetesguatemala

- Se recibira diploma y un digital badge

## Porque aprender Docker?
- Segun la enceunta de stack overflow docker y contenirizacion es el 3er mas popular.
- Esta entre las 2da plataforma mas amada.
- Esta en la 1ra plataforma mas buscada entre desarrolladores y buscqueda de talento. 
- (No se puede saber kubernetes sin saber docker)
- Si nos gusta Azure, nos presenta un Azure container serices o instances. Si queremos utilizar algo como ACI o AKS debemos saber docker.
- Docker es el pilar de Kubernetes (AKS, EKS, GKE)
- Si estamos en AWS quien ofrese 3 servicios AWSfargate, AmazonECS, AmazonEKS.
- Del lado de Google Cloud, utiliza Google App Engine y GKE.
- Hay que saber docker antes de saber kubernetes.

### Que es Docker?
- **Developer:** use Docker to elimante "works on my machine" problems when collaborating on code with co-workers. No es un silver bullet o solucion definitiva, doccker no va a eliminar mi memory leak.
- **Operators:** use Docker para corre aplicaciones alado de otra side-by-side en cojunto o correrlas juntas en la misma infraestructura para aprovechar mis recursos.
- **Enterprises:** use Docker to build agile software delivery pipelines to ship new features, more securely and with confidence for both Linux and Server apps. Entregar software de manera mas segura, rápida. 
Como venderlo al jefe en el aspecto economico: Cuando se usa conjuntamente con un orquestador como Kubernetes o docker swarn. Elimina configuraciones diferentes. Cuanto te gasta hacer un release, que te equivocas o te da miedo, se tardan dias, semanas, meses, porque cuando se lanza a produccion tarda horas en darse cuenta, todo el tiempo que usas arreglando errores, todos los errores en tiempo de recuperacion se pueden traducir a numeros.

#### Que es Docker? que hara por mi?
Docker comparte el kernel del sistema operativo host. Sobre los contendores puedo tener configuraciones homogenias.
Alpine es una distribucion muy famosa por el tamanio de 5 o 7 megas. Varios contenedores viven en una misma computadora no importa que sistema base usa cada contenedor.

Docker me permite tener esos ambientes heterogeneos.
Una de las ventajas de docker es que corren un solo proceso. Se debe tener consideraciones a tener enc uenta para que sea seguro, puedo aplicar politicas de seguridad de SELinux. Puedo decirle que use cierta cantidad de memoria RAM.
Docker tienen un load balancer.

docker se usa para apps stateless. Y si puede tener persistencia local.
PErmite separar o encapsular las dependencias de mi aplicacion.
Con docker puedo tener un ejecutable, y yo puedo instanciarlo y correrlo 9 veces.
Con algo como un orquestador, ya sea kubernetes, swarn o docker compose.
No se recomienda tener todas las cosas en un miismo contendedor, mejor seria tener nginx y mi codigo frontenden un contenedor y otro contenedor con el backend en Node.js ya que se puede hacer comunicacion entre contendedores.

Supongamos que mi app es una app de python y ubuntu, docker me permite empaquetar todo ubuntu y python y puedo generar un paquete que se llama `Docker Image`, el docker image es como un ejecutable o un binario.

Puedo versiona mis contendedores? -> Richard, si, creas tags, podes usar docker hub tiene una capa gratuita

De un docker image puedo generar un contenedor de la misma imagen.
Cuando uno corre en wndows existe algo que se llama windows container pero hoy se vera linux containers. windows containers es una implementacion aparte.
Una iamgen seria una clase y un objeto seria un caontainer.

1. Siempre el mismo entorno, por que todas las dependencias estas metidas ahi mismos
2. Snadbox, evitar conflictos entre versiones con otra aplicacion que tenemos en la misma maquita. Ej. contenedor con node 10 y otro contenedor con node 12
3. Facil de mover: siempre funciona. Es bueno paa entornos de desarrollo, uso para mi aplicacion pasarla a un servidor corra mi app y asegurarnos de que siempre corra y funciona perfectamente y no tener el problema de que funcionaba en mi maquina y en tu maquina no. Nos aseguramos que todas las dependencias esten dentro del contenedor.


### Containers vs  VMS
Docker la hicieron explotando una tecnologia que se llama linux containers. 
Con MV tengo recursos despediciados.

Las capas son la Infraestructura, Hypervisor, y las maquinas virtuales.
Dentro de cada maquina virtual tiene el sistema operativo, los cuales tienen muchas cosas dentro y son muy pesadas, ademas de que usan mucha ram, disco, ect. 

En docker  solo tenemos la infraestrtuctura, el Host Operating system y Docker, y de ahi muchos contenderes o aplicaciones. Todas las aplicaciones estan compartiendo el kernel.

### Vocabulario de Dockerfile
- Docker Image: representa su aplicaion y dependencias.
- Docker Container: instancia de una imagen.
- Docker Engine: es lo que corre en mi maquina.
- Registry Service (Docker hub or Docker trusted Registry)

### Que bbeneficios me dara?
- docker agrega velocidad
  - Desarrollar mas rapido, permite la inicializacion y agregar neuvas personas al equipo.
  - Compilar mas rapido.
  - Probar mas rapido.
  - Deploy mas rapido, si uso docker junto con un orquestador.
  - Recuperacion mas rapida. Cuanto me tardo yo en recuperarlo? loggin rdp a ver que esta pasando, con docker puedo tener autoheiling.

### Que beneficios me dara?
- AMbientes consistentes
- Aislamiento
- Run anywhere, puedo crear una iagen una vez y correrlo en cualquier lugar. Crear cloud native, cloud factor apps (aplicaciones de proxima generacion o faciles de migrar a cloud)

### Docker

Docker lo que hace es correr una imagen, esa imagen es una copia de nuestra aplicacion junto con los archivos de la distribucion de linux. 
Osea que en la imagen voy a tener el sistema operativo (ej, Ububtu), elsoftware que necesita mi aplicacion para correr (ej. Node.js,Ngnx) y aparte mi aplicacion osea el codigo que voy a correr.

Ddocker correr una imagen, esa imagen yo la puedo crear basandome en un `dockerfile` que basicamente es una lista de tareas para crear una imagen.

```dockerfile
# Dockerfile

FROM ubuntu

RUN apt-get install apache2

CMD ["apache2"]
```

Si yo a ese `dockerfile` lo construyo o le hago un build se convierte en una imagen y despues yo uso esa imamgen para correr o hacer un `docker run` a mi contenedor.

Imagen es como una clase y el contenedor es como un objeto, es decir puedo instanaciar varios objetos en docker a partir de una imagen puedo crear varios contenedores.

### Hasta donde ha llegado Docker?
Los grander bancos como el Bank of America, JP Morgan usan docker, chick-fil-A, todo lo que usan cajas, ventas, usan docker y asi mismo cada uno de sus restaurantes. La NASA usa docker en sus spaceships/transbordadores en algunos modulos. SpaceX o tesla usa docker,  US Air Force, VISA, PAYPAL usan docker.
docker se ha convertido en el standar OCI aunque no es el unico, no solo existe docker, algo como postman container BI que es opensource.
En seguridad los usan para crear iamgenes libre de virus.

### Instalacion - Docker Desktop for Windows
- Buscar docker for windows.

#### Instalar docker en Linux

- Agregar usuario al grupo de docker para no tener que estar pasandonos a root para usarlo.

`sudo usermod -a -G docker richard` o `sudo usermod -aG docker $USER`, luego debemos correr `newgrp docker` para activar los cambios al grupo docker. Ahora podemos usar docker desde nuestro usuario normal quie no sea root.

### docker container Run
Para correr nuestro primer contenedor en nuestro terminal
  `docker container run -it  --name minginx --publish 9090:80 --rm ngnx`
Que puedo hacer para acceder a nuestro contenedor:
`curl localhost:9090`

docker funciona con un CLI, con docker puedo conectarme a un servidor remoto de docker y correr comandos

-it : levantarlo en modo interactivo y correrlo en un terminal
--name: para darle nombre a mi contenedor, con la aplicacion de coker puedo ver 
--publish: significa publicame un puerto, esto se conoce como PORT_FORWARD hacer un port_forward el puerto 9090 del puerto 80, el numero de la izquierda es el numero de mi maquina y el numero a la derecha es el puerto del contendeor.
--rm: remove after stop cuando yo lo detenga
nginx: especifica la imagen que yo quiero correr

Puedo correr una version especifica.
`docker container run -it  --name minginx --publish 9090:80 --rm ngnx:1.7`
Lo que me dice es que no la encuentra localmente, docker se va al `registry-image` que es un repositorio de imagenes publicas donde se pueden publicar iamgenes y me trae la version de ngnx con la version respectiva.

`docker container run -d  --name minginx --publish 9090:80 --rm ngnx:1.7`

-d: es para demonizarlo

Hay que tener en ceunta que pueden haber conflictos segun el nombre del contendeor y el puerto.
`Docker container prune -f`

Visualizer o portainer se puede usarpara ver algo grafico, pero mejor es la terminal.

`docker ps` : para listar mis contenedores, y docker les da un id.
A las imagenes puedo modificarlas o agregarles cosas personalizadas.

Puedo correr contenedores sin puerto y nombre.

Si quiero ver algo espeficico de un contenedor.
Utiliza la misma imagen y hace instancias.
Una buena practica de seguridad es no correr con root.

- Como meterme a un contenedor si tengo un container attached:
`docker container exec -it nombre_contenedor date`
Los comandos corren dentro del contenedor
`docker container exec -it nombre_contenedor sh`
# ps aux -> aqui estoy dentro del contenedor y con -it corre como modo interactivo.

Cuando instalo docker creo un grupo docker, entonces mi usuario con el que yo trabajo debo agregarlo a ese grupo.
Como correr docker enla nube? tiene una integracion con docker, puedo agregar una maquina virtuaal en google cloud o aws y hay formas desde mi temrinal conectarme o llegar a docker de la nube.

Hay que tener cuidado con docker, resultaba que hay imagenes en el registry y hay iamgenes que corrian miners para generar bitcoins. Hay iamgenes en library pero ellos le pasan un escaneo de vulnerabilidades.
Es dificil confiar en imagenes desacrgadas de cualquier lugar, hay varios registry de docker.

Con docker puedo correr un contenedor de
`docker container run --privileged `

Que otras cosas me puede dar docker. Si quiero aprender linux y tengo windows o mac. puedo correr ubuntu.
`docker run -it ubuntu:18.04 bash`
Tener en ceunta que si reinicio el contender lo que haya creado no es persistente sino le attache un volumen.
Hay que aprender como trabajar estas cosas.
`docker run -it centos:7 bash`

`docker images`
`df -h` , puedo configurar para que usen  cierta cantidad de gb, en linux todos los contenderos vana usar loq ue tenga mi host.
Un secreto o tip puedo usar 4primeros caracteres del container id para hacer un exec


### Docker build -> ship -> Run
Unb workflow usual en docker.
Build (develoment) -> registry hay privados-> y lo puedo despelgar en cualquier lado.

### Vamos a empezar a escribir mis docker files
Repositorio git que tiene codigo fuente para laboratorio de catacoa: https://cutt.ly/ppTQLs4

Podemos usar el taller guiado: https://www.katacoda.com/mcano/scenarios/docker101

#### Crear app bash

```sh
#!/bin/bash
#myapp.sh
for i in {1..10};do
  echo "[$i] contando ..."
  sleep 2
  #CURL HTTP://IFCONFIG.ME
done
```

corro bash myapp.sh

Creadmos un archivo llamado `dockerfile`, puedo buscar la documentacion den Dockerfile reference, aqui no es importante la identacion.
```
FROM ubuntu:18.04  
```
Quiero el codigo de mi applicacion dentro de esta imagen, puedo usar 2 directivas 
```
FROM ubuntu:18.04

COPY source dest
```
source: es lo que hay en mi computadora,
destino: es el directorio dentro del contenedor.

Ahora tengo que crear mi docker_image:
`docker image build -t "desdecero" .`, aqui construi mi imagen
`docker run -it --rm desdecero:latest bash`, aqui ya podemos navegar a /app y puedo ver mi archivo.

Hay otro comando en dockerfile `ADD` es similar a COPY pero con diferencia, COPY es sencillo y ADD es mas complejo.
Cada vez que hago un cambio a mi docker file debo volver a compilar o hacer un docker run.
Resuelven exatamente el mismo problema, para cosas como copiar archivo usar COPY y no ADD
`docker image build -t "desdecero" .`
`docker run -it --rm desdecero:latest bash`

Yo tengo mi imagen, tengo el contenedor, entrar al folder y que se corra mi app y quede levantado.
`docker run -it --rm desdecero:latest`, en docker file hay 2 maneras de resolver esto.
*manera basica*: 
```
#* notacion Arreglo recomendada
CMD ["bash","/app/myapp.sh"]
```

Compilamos y sin entrar a mi app ya corre mi app/

Si cambio mi ,yapp.sh
```sh
#!/bin/bash

: ${wait_time:="2"}
for i in {1..10};do
  echo "[$i] contando ... wt=${wait_time}"
  sleep 2
  #CURL HTTP://IFCONFIG.ME
done
```

Puedo ponerl labels a mis iamgenes:
`docker run -it --rm desdecero:v1.0`

`docker run -e "wait_time=1" -it --rm desdecero:latest`, configura una variable de aplicacion, asi le paso parametros a docker
Con bash no puedo hacer `ctrl + c` y no funciona. El tiene la respuesta.


PAra que VC se vea asi tiene isntalado la ext de docker de miscrosoft, los iconos son vscode icons, ext better comments. el shell se ve asi porque modifico una variable que se llama PS1.

Comom hacer para tener variables variables de entorno. Puedo crear un `vars.env`
lo corro asi `docker run -env-file=vars.env -it --rm desdecero:latest` y paso todas las variables de entorno a la vez

Como puedo arreglar el que no pueda sobreescribir el `CMD` una de ellas es usar la directiva `ENTRYPOINT` es el comando por defecto pero tiene mayor precedencia que CMD y as complicado sobreescribir.

lA MANERA CORRECTA DE SOBREESCRIBIR UN entrypoint DE UAN IMAGEN ES :
`docker run -env-file=vars.env -it --rm --entrypoint bash desdecero:latest`

Lo que pasa es `docker run -env-file=vars.env -it --rm desdecero:latest -c "ls -la"`

Si dejo el CMD [] puedo configurar mi aplicacion en tiempo de ejecucion con una serie de argumentos o banderas
`docker run -env-file=vars.env -it --rm desdecero:v1.0 --fubar --local`

Quiero que mi aplicacion en funciona de un argumento, si es que paso algun argumento curl ejecutarlo, pero dentro mi contenedor debo instalar curl para que tenga mi dependencia.
En dockerfile hay una directiva que se llama `RUN QUE EJECUTA COMANDOS PREVIOS A crear la i magen como instalar una libreria compilar algo, si quiero alguna aplicacion o interaccion humana debo ingeniarmelas para automatizar esos comandos.
`time docker image build  -t "desdecero:v1.0"`

Consejos con `layers`
Hay un comando que se llama 

`docker images history`

`docker run -env-file=vars.env -it --rm desdecero:v1.0 --fubar --local`

- Pirmera recomendacion: Si yo se que hay un archivo que nunca va a cambiar, comandos de docker como post, label, eso siempre se pone al principio de un docker file y las cosas que siempre van a estar cambiando ponerlo al final.
- Segunda recomendacion: no usar varios `RUN` mejor es concatenar el siguiente comando && para concatenar y \ siguiente linea

PAra el comando RUN puedo crear un archivo de los comando de linux
```
COPY install_script.sh 
RUN install_Script.sh
```

Siempre quiero invalidar el cash

Si quiero usar directorios
`WORKDIR`


### nETWORKING ENTRE CONTENDORES

`docker inspect contenedor_name`, me da una descripcion completa de todo el contenedor, docker tiene un gateeway que siempre es igual para todos los contendedores.