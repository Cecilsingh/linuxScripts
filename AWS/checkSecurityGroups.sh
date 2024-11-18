#!/bin/bash

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it and configure your credentials."
    exit 1
fi

# Obtain all security groups and iterate through them.
security_groups=$(aws ec2 describe-security-groups --query "SecurityGroups[*].{ID:GroupId,Name:GroupName}" --output json)

# Check if there are any security groups. If none found, display error.
if [[ $(echo "$security_groups" | jq length) -eq 0 ]]; then
    echo "No security groups found."
    exit 1
fi

# Loop through each security group.
for sg in $(echo "$security_groups" | jq -c '.[]'); do
    sg_id=$(echo "$sg" | jq -r '.ID')
    sg_name=$(echo "$sg" | jq -r '.Name')

    echo "Security Group ID: $sg_id | Name: $sg_name"

    # Check Inbound rules.
    echo "Inbound Rules:"
    inbound_rules=$(aws ec2 describe-security-groups --group-ids "$sg_id" --query "SecurityGroups[*].IpPermissions" --output json)
    echo "$inbound_rules" | jq -r '.[][] | "  Protocol: \(.IpProtocol)\n  From Port: \(.FromPort)\n  To Port: \(.ToPort)\n  CIDR: \(.IpRanges[].CidrIp)"'

    # Check Outbound rules.
    echo "Outbound Rules:"
    outbound_rules=$(aws ec2 describe-security-groups --group-ids "$sg_id" --query "SecurityGroups[*].IpPermissionsEgress" --output json)
    echo "$outbound_rules" | jq -r '.[][] | "  Protocol: \(.IpProtocol)\n  From Port: \(.FromPort)\n  To Port: \(.ToPort)\n  CIDR: \(.IpRanges[].CidrIp)"'

    echo "--------------------------------------------------"
done
