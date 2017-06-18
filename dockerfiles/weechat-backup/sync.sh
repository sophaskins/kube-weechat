#! /bin/sh

export S3_BUCKET=`cat /secrets/s3-bucket`
export AWS_ACCESS_KEY_ID=`cat /secrets/access-key-id`
export AWS_SECRET_ACCESS_KEY=`cat /secrets/secret-access-key`

aws s3 sync /weechat-logs "s3://${S3_BUCKET}"
