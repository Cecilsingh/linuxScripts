import pulumi
from pulumi_aws import s3

# Create an AWS resource (S3 Bucket)
bucket = s3.Bucket('my-created-bucket')

# Export the name of the bucket
pulumi.export('bucket_name', bucket.id)
