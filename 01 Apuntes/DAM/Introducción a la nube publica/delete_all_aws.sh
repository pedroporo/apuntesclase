#!/usr/bin/env bash

# based on https://gist.github.com/jokeru/e4a25bbd95080cfd00edf1fa67b06996
# Made modifications to remove need for jq, set AWS_DEFAULT_REGION so you don't have to specify --region explicitly
#  Add region 'human-readable' names
REGIONS='us-east-1
us-east-2
us-west-1
us-west-2
eu-central-1
eu-west-1
eu-west-2
eu-west-3
eu-north-1
ap-northeast-1
ap-northeast-2
ap-south-1
ap-southeast-1
ap-southeast-2
ca-central-1
sa-east-1
ap-northeast-3
ap-east-1
me-south-1
af-south-1
eu-south-1'

INDENT='    '

echo "Using profile ${AWS_PROFILE:-default}"

for REGION in $REGIONS; do
    export AWS_DEFAULT_REGION=$REGION
    echo "* Region ${REGION}"

    # Skip regions where we don't have permissions or access
    if ! aws sts get-caller-identity --region $REGION >/dev/null 2>&1; then
        echo "${INDENT}No access to region or invalid credentials"
        continue
    fi

    # get default vpc
    vpc=$(aws ec2 describe-vpcs --filter Name=isDefault,Values=true --output text --query 'Vpcs[0].VpcId' 2>/dev/null || echo "None")
    if [ "${vpc}" = "None" ] || [ -z "${vpc}" ]; then
        echo "${INDENT}No default vpc found"
        continue
    fi
    echo "${INDENT}Found default vpc ${vpc}"

    # First terminate all EC2 instances to resolve dependency issues
    echo "${INDENT}Terminating EC2 instances..."
    instances=$(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --output text 2>/dev/null)
    if [ ! -z "${instances}" ] && [ "${instances}" != "None" ]; then
        # Enable termination protection
        for instance in $instances; do
            echo "${INDENT}${INDENT}Disabling termination protection for instance ${instance}"
            aws ec2 modify-instance-attribute --no-disable-api-termination --instance-id $instance
        done
        
        # Terminate instances
        echo "${INDENT}${INDENT}Terminating instances..."
        aws ec2 terminate-instances --instance-ids $instances >/dev/null 2>&1
        
        # Wait for instances to terminate
        echo "${INDENT}${INDENT}Waiting for instances to terminate..."
        for instance in $instances; do
            aws ec2 wait instance-terminated --instance-ids $instance 2>/dev/null
        done
    fi

    # Release Elastic IP addresses
    echo "${INDENT}Releasing Elastic IP addresses..."
    addresses=$(aws ec2 describe-addresses --query 'Addresses[].AllocationId' --output text 2>/dev/null)
    if [ ! -z "${addresses}" ] && [ "${addresses}" != "None" ]; then
        for address in $addresses; do
            echo "${INDENT}${INDENT}Releasing Elastic IP ${address}"
            aws ec2 release-address --allocation-id $address
        done
    fi

    # Delete NAT Gateways
    echo "${INDENT}Deleting NAT Gateways..."
    nat_gws=$(aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$vpc" --query 'NatGateways[].NatGatewayId' --output text 2>/dev/null)
    if [ ! -z "${nat_gws}" ] && [ "${nat_gws}" != "None" ]; then
        for nat_gw in $nat_gws; do
            echo "${INDENT}${INDENT}Deleting NAT Gateway ${nat_gw}"
            aws ec2 delete-nat-gateway --nat-gateway-id $nat_gw
        done
        
        # Wait for NAT Gateways to be deleted
        for nat_gw in $nat_gws; do
            echo "${INDENT}${INDENT}Waiting for NAT Gateway ${nat_gw} to be deleted..."
            aws ec2 wait nat-gateway-deleted --nat-gateway-ids $nat_gw 2>/dev/null
        done
    fi

    # Delete VPC Endpoints
    echo "${INDENT}Deleting VPC Endpoints..."
    endpoints=$(aws ec2 describe-vpc-endpoints --filters "Name=vpc-id,Values=$vpc" --query 'VpcEndpoints[].VpcEndpointId' --output text 2>/dev/null)
    if [ ! -z "${endpoints}" ] && [ "${endpoints}" != "None" ]; then
        for endpoint in $endpoints; do
            echo "${INDENT}${INDENT}Deleting VPC Endpoint ${endpoint}"
            aws ec2 delete-vpc-endpoint --vpc-endpoint-id $endpoint
        done
    fi

    # Delete Load Balancers
    echo "${INDENT}Deleting Load Balancers..."
    
    # ELBv2 (ALB/NLB)
    elbs_v2=$(aws elbv2 describe-load-balancers --query "LoadBalancers[?VpcId=='$vpc'].LoadBalancerArn" --output text 2>/dev/null)
    if [ ! -z "${elbs_v2}" ] && [ "${elbs_v2}" != "None" ]; then
        for elb in $elbs_v2; do
            echo "${INDENT}${INDENT}Deleting Load Balancer ${elb}"
            aws elbv2 delete-load-balancer --load-balancer-arn $elb
        done
    fi
    
    # Classic ELB
    elbs_classic=$(aws elb describe-load-balancers --query "LoadBalancerDescriptions[?VPCId=='$vpc'].LoadBalancerName" --output text 2>/dev/null)
    if [ ! -z "${elbs_classic}" ] && [ "${elbs_classic}" != "None" ]; then
        for elb in $elbs_classic; do
            echo "${INDENT}${INDENT}Deleting Classic Load Balancer ${elb}"
            aws elb delete-load-balancer --load-balancer-name $elb
        done
    fi

    # Delete security groups (except default)
    echo "${INDENT}Deleting non-default security groups..."
    sgs=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$vpc" "Name=group-name,Values=!default" --query 'SecurityGroups[].GroupId' --output text 2>/dev/null)
    if [ ! -z "${sgs}" ] && [ "${sgs}" != "None" ]; then
        for sg in $sgs; do
            echo "${INDENT}${INDENT}Deleting security group ${sg}"
            aws ec2 delete-security-group --group-id $sg 2>/dev/null
        done
    fi

    # Delete network ACLs (except default)
    echo "${INDENT}Deleting non-default network ACLs..."
    nacles=$(aws ec2 describe-network-acls --filters "Name=vpc-id,Values=$vpc" "Name=default,Values=false" --query 'NetworkAcls[].NetworkAclId' --output text 2>/dev/null)
    if [ ! -z "${nacles}" ] && [ "${nacles}" != "None" ]; then
        for nacl in $nacles; do
            echo "${INDENT}${INDENT}Deleting network ACL ${nacl}"
            aws ec2 delete-network-acl --network-acl-id $nacl
        done
    fi

    # Delete route tables (except main)
    echo "${INDENT}Deleting non-main route tables..."
    rts=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$vpc" "Name=association.main,Values=false" --query 'RouteTables[].RouteTableId' --output text 2>/dev/null)
    if [ ! -z "${rts}" ] && [ "${rts}" != "None" ]; then
        for rt in $rts; do
            # First disassociate all subnets
            associations=$(aws ec2 describe-route-tables --route-table-ids $rt --query 'RouteTables[].Associations[].RouteTableAssociationId' --output text 2>/dev/null)
            if [ ! -z "${associations}" ] && [ "${associations}" != "None" ]; then
                for association in $associations; do
                    aws ec2 disassociate-route-table --association-id $association
                done
            fi
            echo "${INDENT}${INDENT}Deleting route table ${rt}"
            aws ec2 delete-route-table --route-table-id $rt
        done
    fi

    # get internet gateway
    igw=$(aws ec2 describe-internet-gateways --filter Name=attachment.vpc-id,Values=${vpc} --output text --query 'InternetGateways[0].InternetGatewayId' 2>/dev/null || echo "None")
    if [ "${igw}" != "None" ] && [ ! -z "${igw}" ]; then
        echo "${INDENT}Detaching and deleting internet gateway ${igw}"
        aws ec2 detach-internet-gateway --internet-gateway-id ${igw} --vpc-id ${vpc} 2>/dev/null
        aws ec2 delete-internet-gateway --internet-gateway-id ${igw} 2>/dev/null
    fi

    # get subnets
    subnets=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=${vpc} --output text --query 'Subnets[].SubnetId' 2>/dev/null || echo "None")
    if [ "${subnets}" != "None" ] && [ ! -z "${subnets}" ]; then
        for subnet in ${subnets}; do
            echo "${INDENT}Deleting subnet ${subnet}"
            aws ec2 delete-subnet --subnet-id ${subnet} 2>/dev/null
        done
    fi

    # delete default vpc
    echo "${INDENT}Deleting vpc ${vpc}"
    aws ec2 delete-vpc --vpc-id ${vpc} 2>/dev/null

    # get default dhcp options (only delete if not in use)
    dhcp=$(aws ec2 describe-dhcp-options --output text --query 'DhcpOptions[0].DhcpOptionsId' 2>/dev/null || echo "None")
    if [ "${dhcp}" != "None" ] && [ ! -z "${dhcp}" ]; then
        # Check if DHCP options are associated with any VPC
        associations=$(aws ec2 describe-vpcs --filters "Name=dhcp-options-id,Values=$dhcp" --query 'Vpcs[].VpcId' --output text 2>/dev/null)
        if [ -z "${associations}" ] || [ "${associations}" = "None" ]; then
            echo "${INDENT}Deleting dhcp ${dhcp}"
            aws ec2 delete-dhcp-options --dhcp-options-id ${dhcp} 2>/dev/null
        else
            echo "${INDENT}DHCP options ${dhcp} still in use, skipping deletion"
        fi
    fi

    echo "${INDENT}Cleanup completed for region ${REGION}"
    echo
done