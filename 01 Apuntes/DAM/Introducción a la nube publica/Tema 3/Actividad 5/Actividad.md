---
dg-publish: true
---
Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **Act 3.5 - La Ruta  53: Motoriastas Fantasmas**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>

## Configuracion de zona alojada

![[Pasted image 20251124192305.png]]

## Registros R53
Registro a maquina 1:
![[Pasted image 20251124193734.png]]
Registro a maquina 2: ![[Pasted image 20251124194035.png]]
Registro Maquina 3:![[Pasted image 20251124194159.png]]
Registro Maquina 4:![[Pasted image 20251124194412.png]]

## Script para crear los 4 webservers
```bash
#!/bin/bash

  
  

INSTANCE_COUNT=4

INSTANCE_TYPE="t2.micro"

AMI_ID="ami-0ecb62995f68bb549"

KEY_NAME="awsKeys"

SECURITY_GROUP="sg-0095367823a8ae304"

REGION="us-east-1"

SUBNET_ID="subnet-048543a2dd17a49ac"

  

create_instance() {

local instance_name=$1

local user_data=$2

  

aws ec2 run-instances \

--image-id $AMI_ID \

--count 1 \

--instance-type $INSTANCE_TYPE \

--key-name $KEY_NAME \

--security-group-ids $SECURITY_GROUP \

--subnet-id $SUBNET_ID \

--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \

--user-data "$user_data" \

--associate-public-ip-address \

--region $REGION

}

  
  

for i in {1..4}; do

instance_name="Webserver-$i"

user_data="#!/bin/bash

sudo apt update -y

sudo apt install apache2 -y

echo '<html><body><h1>Webserver $i de Pedro Guill ferri en la maquina $i</h1></body></html>' > /var/www/html/index.html

"

create_instance "$instance_name" "$user_data"

done
```