aws ec2 describe-instances --query 'Reservations[].Instances[].{InstanceId:InstanceId, HttpPutResponseHopLimit:MetadataOptions.HttpPutResponseHopLimit}' --output table
