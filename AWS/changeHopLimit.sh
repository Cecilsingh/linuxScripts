aws ec2 modify-instance-metadata-options \
    --instance-id i-05d1777ca3dd67be3 \
    --http-put-response-hop-limit 2 \
    --http-endpoint enabled
