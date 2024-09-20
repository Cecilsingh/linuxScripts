aws ec2 describe-instances \
    --filters "Name=instance-type,Values=*" \
    --query "Reservations[*].Instances[*].[InstanceId]" \
    --output text
