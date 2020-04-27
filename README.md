# PRÁCTICAS MÓDULO CLOUD

[![Build Status](https://travis-ci.com/JTrillo/cloud-lab.svg?branch=master)](https://travis-ci.com/JTrillo/cloud-lab)

**Docker Image** --> https://hub.docker.com/r/jtrillo/masterlemon7-cloud-lab

**AWS Instance** --> http://ec2-34-245-33-253.eu-west-1.compute.amazonaws.com/
## Preparación

* Cuenta de [Docker Hub](https://hub.docker.com/)
* Cuenta de [AWS](http://aws.amazon.com/)
* Haz un fork de este repositorio

## Práctica 1

Dado este proyecto en NodeJS, crea su Dockerfile sabiendo que nos han pedido como imagen base ubuntu:18.04, versión 10 de NodeJS, el 8888 será el puerto donde exponga la comunicación la applicación, la señal de *STOP* debe llegarle a la aplicación y el contenedor podría ser iniciado con cualquier proceso.

### Solución Práctica 1

Ver [Dockerfile](Dockerfile).

## Práctica 2

Sube la imagen de Docker a DockerHub.

### Solución Práctica 2

Iniciar sesión en Docker Hub
```
docker login
```

Hacer el build de la imagen, tagearla y subirla al registry
```bash
docker build -t lab_app .
docker tag lab_app jtrillo/masterlemon7-cloud-lab
docker push jtrillo/masterlemon7-cloud-lab
```

Ver imagen en [Docker Hub](https://hub.docker.com/r/jtrillo/masterlemon7-cloud-lab).

## Práctica 3

Automatiza el proceso de creación de la imagen de Docker y su subida a Docker Hub después de cada cambio en el repositorio utitlizando Travis CI.

### Solución Práctica 3

* Enlazar este repositorio con Travis CI.
* Añadir las variables de entorno `DOCKER_USER` y `DOCKER_PASSWORD` en las opciones de este repositorio en Travis.
* Hacer un nuevo commit incluyendo el fichero `.travis.yml`.

## Práctica 4

Crea un servidor y despliega la imagen de Docker en AWS utilizando Terraform.

### Solución Práctica 4

* Crear un nuevo usuario en IAM de AWS.
* Crear un key pair en EC2 de AWS.
* Descargar [Terraform](https://wwww.terraform.io/downloads.html). Descomprimir (`unzip terraform.zip`) y añadir al PATH (`sudo mv terraform /usr/local/bin`).
* Crear carpeta `./terraform` y dentro de ella los archivos `script.sh` y `main.tf`.
* Crear las variables de entorno `AWS_ACCESS_KEY_ID` y `AWS_SECRET_ACCESS_KEY` con las credenciales del usuario que creamos en el primer paso.
* Crear el servidor y desplegar la imagen Docker usando Terraform
```bash
terraform init
terraform plan
terraform apply
```

Para probar el correcto funcionamiento de esta práctica haz click [aquí](http://ec2-34-245-33-253.eu-west-1.compute.amazonaws.com/Gonzalo).

