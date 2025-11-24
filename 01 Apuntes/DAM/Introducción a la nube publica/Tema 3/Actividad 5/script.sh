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
