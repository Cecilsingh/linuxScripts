for group_id in $(aws ec2 describe-security-groups --query "SecurityGroups[*].GroupId" --output text); do
  aws ec2 revoke-security-group-egress --group-id $group_id --protocol all --port all --cidr 169.254.169.254/32
done
